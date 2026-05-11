#!/usr/bin/env wish
# Tcl/Tk Glossary Manager - GUI mit Text-Widget
# Version: 1.5

package require Tk
package require tdbc::sqlite3

# Globale Variablen
set ::db_path ""
set ::current_term_id ""
set ::search_history {}

# ============================================================
# License-Konfiguration fuer Export
# Bitte mit deinen Werten anpassen.
# ============================================================
set ::glossary_author        "Gregor Ebbing"
set ::glossary_copyright_year "2025-2026"
set ::glossary_license       "CC BY 4.0"
set ::glossary_license_url   "https://creativecommons.org/licenses/by/4.0/"

# DB-Verbindung (TDBC)
proc connect_db {db_file} {
    if {[catch {tdbc::sqlite3::connection create ::glossdb $db_file} err]} {
        tk_messageBox -type ok -icon error -title "Database Error" \
            -message "Could not open database:\n$err"
        return 0
    }
    set ::db_path $db_file
    return 1
}

# GUI erstellen
proc create_gui {} {
    wm title . "Tcl/Tk Glossary Manager"
    
    # Gespeicherte Geometrie laden (falls vorhanden), sonst Default
    _load_window_state
    
    # Beim Schliessen Geometry speichern
    wm protocol . WM_DELETE_WINDOW save_and_exit
    
    # Menubar
    menu .menu
    . configure -menu .menu
    
    menu .menu.file -tearoff 0
    .menu add cascade -label "File" -menu .menu.file
    .menu.file add command -label "Open..." -command open_database -accelerator "Ctrl+O"
    .menu.file add separator
    .menu.file add command -label "Export..." -command export_database
    .menu.file add separator
    .menu.file add command -label "Quit" -command save_and_exit -accelerator "Ctrl+Q"
    
    menu .menu.edit -tearoff 0
    .menu add cascade -label "Edit" -menu .menu.edit
    .menu.edit add command -label "New Entry..." -command new_term -accelerator "Ctrl+N"
    .menu.edit add command -label "Edit..." -command edit_term -accelerator "Ctrl+E"
    .menu.edit add command -label "Delete..." -command delete_term -accelerator "Ctrl+D"
    .menu.edit add separator
    .menu.edit add command -label "Manage Categories..." -command manage_categories
    .menu.edit add separator
    .menu.edit add command -label "Search..." -command focus_search -accelerator "Ctrl+F"
    .menu.edit add command -label "Search Help" -command show_search_help -accelerator "F1"
    
    menu .menu.view -tearoff 0
    .menu add cascade -label "View" -menu .menu.view
    .menu.view add command -label "Categories" -command show_categories
    .menu.view add command -label "Statistics" -command show_statistics
    
    menu .menu.help -tearoff 0
    .menu add cascade -label "Help" -menu .menu.help
    .menu.help add command -label "About..." -command show_about
    
    # Toolbar
    ttk::frame .toolbar
    ttk::button .toolbar.open -text "Open" -command open_database
    ttk::button .toolbar.new -text "New" -command new_term
    ttk::button .toolbar.edit -text "Edit" -command edit_term
    ttk::button .toolbar.delete -text "Delete" -command delete_term
    ttk::separator .toolbar.sep1 -orient vertical
    ttk::button .toolbar.prev -text "< Back" -command prev_term
    ttk::button .toolbar.next -text "Forward >" -command next_term
    ttk::separator .toolbar.sep2 -orient vertical
    ttk::button .toolbar.export -text "Export" -command export_database
    
    pack .toolbar.open .toolbar.new .toolbar.edit .toolbar.delete -side left -padx 2 -pady 4
    pack .toolbar.sep1 -side left -fill y -padx 5 -pady 4
    pack .toolbar.prev .toolbar.next -side left -padx 2 -pady 4
    pack .toolbar.sep2 -side left -fill y -padx 5 -pady 4
    pack .toolbar.export -side left -padx 2 -pady 4
    
    pack .toolbar -side top -fill x
    
    # Search Frame
    ttk::frame .search
    ttk::label .search.lbl -text "Search:"
    ttk::entry .search.entry -textvariable ::search_query
    ttk::button .search.btn -text "Search" -command search_terms
    ttk::button .search.clear -text "Clear" -command clear_search
    
    pack .search.lbl -side left -padx 5 -pady 5
    pack .search.entry -side left -fill x -expand 1 -padx 5 -pady 5
    pack .search.btn -side left -padx 5 -pady 5
    pack .search.clear -side left -padx 5 -pady 5
    
    pack .search -side top -fill x
    
    # Main Area: Paned Window
    ttk::panedwindow .paned -orient horizontal
    
    # Left: Category Combobox + Treeview
    ttk::frame .paned.left
    
    # Combobox fuer schnelle Kategorie-Auswahl
    ttk::frame .paned.left.catframe
    ttk::label .paned.left.catframe.lbl -text "Category:" -font {TkDefaultFont 9}
    ttk::combobox .paned.left.catframe.combo -textvariable ::selected_category \
        -state readonly -width 25
    ttk::button .paned.left.catframe.all -text "Alle" -command load_all_terms -width 6
    
    pack .paned.left.catframe.lbl -side left -padx {5 2}
    pack .paned.left.catframe.combo -side left -fill x -expand 1 -padx 2
    pack .paned.left.catframe.all -side left -padx {2 5}
    
    # Treeview fuer Kategorien + Begriffe
    ttk::frame .paned.left.tree
    ttk::treeview .paned.left.tree.tv -yscrollcommand {.paned.left.tree.sb set} \
        -selectmode browse -height 30
    ttk::scrollbar .paned.left.tree.sb -orient vertical -command {.paned.left.tree.tv yview}
    
    pack .paned.left.tree.tv -side left -fill both -expand 1
    pack .paned.left.tree.sb -side right -fill y
    
    pack .paned.left.catframe -side top -fill x -pady {5 5}
    pack .paned.left.tree -side top -fill both -expand 1
    
    # Right: Text Display
    ttk::frame .paned.right
    
    text .paned.right.text -wrap word -font {TkDefaultFont 10} \
        -yscrollcommand {.paned.right.sb set} -padx 10 -pady 10
    ttk::scrollbar .paned.right.sb -orient vertical -command {.paned.right.text yview}
    
    pack .paned.right.text -side left -fill both -expand 1
    pack .paned.right.sb -side right -fill y
    
    # Tags fuer Formatierung
    .paned.right.text tag configure title -font {TkDefaultFont 18 bold} -foreground #0066cc
    .paned.right.text tag configure heading -font {TkDefaultFont 12 bold} -foreground #333333
    .paned.right.text tag configure category -font {TkDefaultFont 9 italic} -foreground #666666
    .paned.right.text tag configure code -font {Courier 9} -background #f5f5f5 -foreground #d14
    .paned.right.text tag configure example -font {Courier 10} -background #f9f9f9 \
        -lmargin1 20 -lmargin2 20 -spacing1 5 -spacing3 5
    .paned.right.text tag configure note -font {TkDefaultFont 9 italic} -foreground #888888
    .paned.right.text tag configure link -font {TkDefaultFont 9 underline} -foreground #0066cc
    
    .paned add .paned.left -weight 1
    .paned add .paned.right -weight 3
    
    pack .paned -side top -fill both -expand 1
    
    # Statusbar
    ttk::frame .status
    ttk::label .status.lbl -textvariable ::status_text -anchor w
    ttk::separator .status.sep -orient horizontal
    
    pack .status.sep -side top -fill x
    pack .status.lbl -side left -fill x -expand 1 -padx 5 -pady 2
    
    pack .status -side bottom -fill x
    
    # Bindings
    bind .search.entry <Return> search_terms
    bind .paned.left.tree.tv <<TreeviewSelect>> on_term_select
    bind .paned.left.tree.tv <Double-Button-1> edit_term
    bind .paned.left.catframe.combo <<ComboboxSelected>> on_category_select
    
    bind . <Control-o> open_database
    bind . <Control-q> save_and_exit
    bind . <Control-n> new_term
    bind . <Control-e> edit_term
    bind . <Control-d> delete_term
    bind . <Control-f> focus_search
    bind . <F1> show_search_help
    bind . <Alt-Left> prev_term
    bind . <Alt-Right> next_term
    
    set ::status_text "Ready. Please open a database (Ctrl+O)"
}

# DB oeffnen
proc open_database {} {
    set file [tk_getOpenFile -title "Glossary Database" \
        -filetypes {{SQLite {.db}} {All *}}]
    
    if {$file eq ""} return
    
    if {[llength [info commands ::glossdb]]} {
        catch {::glossdb close}
    }
    
    if {![connect_db $file]} return
    
    set ::status_text "Database: [file tail $file]"
    load_all_terms
}

# Alle Terms laden (TDBC) - Treeview mit Kategorien
# ============================================================
# Kategorien-Verwaltung
# ============================================================

proc manage_categories {} {
    set w .catmgr
    if {[winfo exists $w]} {
        wm deiconify $w
        focus $w
        return
    }
    
    toplevel $w
    wm title $w "Manage Categories"
    wm geometry $w 600x500
    wm transient $w .
    
    # Header / Filter
    set top [ttk::frame $w.top -padding 8]
    pack $top -fill x
    ttk::label $top.lbl -text "Filter:"
    ttk::entry $top.filter -textvariable ::catmgr_filter
    pack $top.lbl -side left
    pack $top.filter -side left -fill x -expand 1 -padx {6 0}
    
    # Treeview mit Spalten Kategorie / Anzahl
    set tf [ttk::frame $w.tf]
    pack $tf -fill both -expand 1 -padx 8 -pady {0 8}
    
    set tv $tf.tv
    ttk::treeview $tv -columns {category count} -show headings \
        -yscrollcommand "$tf.sb set" -selectmode browse
    $tv heading category -text "Category"
    $tv heading count    -text "Terms"
    $tv column  category -width 420 -anchor w
    $tv column  count    -width 70  -anchor e
    ttk::scrollbar $tf.sb -orient vertical -command "$tv yview"
    pack $tf.sb -side right -fill y
    pack $tv -side left -fill both -expand 1
    
    # Button-Leiste
    set bf [ttk::frame $w.bf -padding 8]
    pack $bf -fill x
    ttk::button $bf.rename  -text "Rename..." -command "_catmgr_rename $tv"
    ttk::button $bf.merge   -text "Move terms..." -command "_catmgr_merge $tv"
    ttk::button $bf.delete  -text "Delete (empty only)" -command "_catmgr_delete $tv"
    ttk::button $bf.refresh -text "Refresh" -command "_catmgr_load $tv"
    ttk::button $bf.close   -text "Close" -command "destroy $w"
    pack $bf.rename $bf.merge $bf.delete -side left -padx {0 4}
    pack $bf.close $bf.refresh -side right -padx {4 0}
    
    # Status
    ttk::label $w.status -textvariable ::catmgr_status -anchor w \
        -relief sunken -padding 4
    pack $w.status -fill x -side bottom
    
    # Doppelklick = Umbenennen
    bind $tv <Double-Button-1> "_catmgr_rename $tv"
    
    # Filter-Live-Update
    set ::catmgr_filter ""
    trace add variable ::catmgr_filter write [list _catmgr_filter_apply $tv]
    
    bind $w <Destroy> {
        catch {trace remove variable ::catmgr_filter write [list _catmgr_filter_apply %W]}
    }
    
    # Initial laden
    _catmgr_load $tv
}

proc _catmgr_load {tv} {
    $tv delete [$tv children {}]
    
    foreach row [::glossdb allrows -as lists {
        SELECT category, COUNT(*) FROM terms GROUP BY category ORDER BY category
    }] {
        set cat [lindex $row 0]
        set cnt [lindex $row 1]
        $tv insert {} end -values [list $cat $cnt]
    }
    
    set total [llength [$tv children {}]]
    set ::catmgr_status "$total categories loaded"
}

proc _catmgr_filter_apply {tv args} {
    if {![winfo exists $tv]} return
    set pattern [string tolower $::catmgr_filter]
    
    $tv delete [$tv children {}]
    
    if {$pattern eq ""} {
        _catmgr_load $tv
        return
    }
    
    foreach row [::glossdb allrows -as lists {
        SELECT category, COUNT(*) FROM terms GROUP BY category ORDER BY category
    }] {
        set cat [lindex $row 0]
        set cnt [lindex $row 1]
        if {[string match "*$pattern*" [string tolower $cat]]} {
            $tv insert {} end -values [list $cat $cnt]
        }
    }
    
    set total [llength [$tv children {}]]
    set ::catmgr_status "$total categories (filter: '$::catmgr_filter')"
}

proc _catmgr_selected {tv} {
    set sel [$tv selection]
    if {$sel eq ""} {
        tk_messageBox -type ok -icon info -parent .catmgr \
            -message "Please select a category first."
        return ""
    }
    return [lindex [$tv item $sel -values] 0]
}

proc _catmgr_count {category} {
    set r [::glossdb allrows -as lists {
        SELECT COUNT(*) FROM terms WHERE category = :category
    }]
    return [lindex [lindex $r 0] 0]
}

proc _catmgr_rename {tv} {
    set old [_catmgr_selected $tv]
    if {$old eq ""} return
    
    set count [_catmgr_count $old]
    
    # Eingabedialog
    set new [_catmgr_input "Rename category" \
        "Current category:\n  '$old'\n\nContains terms: $count\n\nNew name:" $old]
    
    if {$new eq "" || $new eq $old} return
    
    # Bereits vorhanden?
    set existing [_catmgr_count $new]
    if {$existing > 0} {
        set yn [tk_messageBox -type yesno -icon warning -parent .catmgr \
            -message "Category '$new' already exists with $existing terms.\n\nDo you want to move the terms from '$old' there (merge)?"]
        if {$yn ne "yes"} return
    }
    
    # UPDATE in einer Transaktion
    if {[catch {
        ::glossdb begintransaction
        set stmt [::glossdb prepare {
            UPDATE terms SET category = :new, updated_at = datetime('now')
            WHERE category = :old
        }]
        $stmt execute
        $stmt close
        ::glossdb commit
    } err]} {
        catch {::glossdb rollback}
        tk_messageBox -type ok -icon error -parent .catmgr \
            -message "Error during rename:\n$err"
        return
    }
    
    set ::catmgr_status "Renamed: '$old' -> '$new' ($count terms)"
    _catmgr_load $tv
    
    # Hauptfenster aktualisieren
    load_all_terms
    _catmgr_refresh_combobox
}

proc _catmgr_merge {tv} {
    set src [_catmgr_selected $tv]
    if {$src eq ""} return
    
    set count [_catmgr_count $src]
    if {$count == 0} {
        tk_messageBox -type ok -icon info -parent .catmgr \
            -message "Category '$src' contains no terms."
        return
    }
    
    # Andere Kategorien zur Auswahl
    set others {}
    foreach row [::glossdb allrows -as lists {
        SELECT DISTINCT category FROM terms WHERE category != :src ORDER BY category
    }] {
        lappend others [lindex $row 0]
    }
    
    if {[llength $others] == 0} {
        tk_messageBox -type ok -icon info -parent .catmgr \
            -message "No other category available."
        return
    }
    
    set target [_catmgr_pick_category "Move terms" \
        "Move all $count terms from\n  '$src'\n\nTo:" $others]
    
    if {$target eq ""} return
    
    # Bestaetigung
    set yn [tk_messageBox -type yesno -icon question -parent .catmgr \
        -message "Move $count terms from '$src' to '$target'?\n\nThe category '$src' will disappear afterwards."]
    if {$yn ne "yes"} return
    
    # Konflikt-Check: gleicher Term-Name in beiden Kategorien?
    set conflicts [::glossdb allrows -as lists {
        SELECT t1.term FROM terms t1
        WHERE t1.category = :src
          AND EXISTS (SELECT 1 FROM terms t2
                      WHERE t2.term = t1.term AND t2.category = :target)
    }]
    
    if {[llength $conflicts] > 0} {
        set names [join [lmap r $conflicts {lindex $r 0}] ", "]
        tk_messageBox -type ok -icon error -parent .catmgr \
            -message "Conflict: these terms already exist in '$target':\n\n$names\n\nPlease resolve manually first (rename or delete)."
        return
    }
    
    # Merge in Transaktion
    if {[catch {
        ::glossdb begintransaction
        set stmt [::glossdb prepare {
            UPDATE terms SET category = :target, updated_at = datetime('now')
            WHERE category = :src
        }]
        $stmt execute
        $stmt close
        ::glossdb commit
    } err]} {
        catch {::glossdb rollback}
        tk_messageBox -type ok -icon error -parent .catmgr \
            -message "Error during move:\n$err"
        return
    }
    
    set ::catmgr_status "Moved: $count terms from '$src' to '$target'"
    _catmgr_load $tv
    load_all_terms
    _catmgr_refresh_combobox
}

proc _catmgr_delete {tv} {
    set cat [_catmgr_selected $tv]
    if {$cat eq ""} return
    
    set count [_catmgr_count $cat]
    
    if {$count > 0} {
        tk_messageBox -type ok -icon warning -parent .catmgr \
            -message "Category '$cat' contains $count terms.\n\nDelete is only allowed for empty categories.\n\nUse 'Move Terms...' to move the terms to another category."
        return
    }
    
    # Da Kategorien aus terms.category abgeleitet sind, kann eine
    # Kategorie ohne Begriffe in der Anzeige eigentlich nicht
    # vorkommen. Falls doch (z.B. concurrent edit), gibt es nichts zu tun.
    tk_messageBox -type ok -icon info -parent .catmgr \
        -message "Category '$cat' is already empty (no terms).\n\nIt will disappear automatically once the list is reloaded."
    _catmgr_load $tv
}

# ----- Helfer-Dialoge -----

proc _catmgr_input {title prompt initial} {
    # Modaler Eingabe-Dialog. Liefert eingegebenen String oder "" bei Abbruch.
    set w .catmgr_input
    if {[winfo exists $w]} { destroy $w }
    toplevel $w
    wm title $w $title
    wm transient $w .catmgr
    wm geometry $w 480x180
    
    ttk::label $w.lbl -text $prompt -padding 10 -justify left
    pack $w.lbl -anchor w -fill x
    
    ttk::entry $w.ent -textvariable ::_catmgr_input_value
    pack $w.ent -fill x -padx 10 -pady 5
    
    set ::_catmgr_input_value $initial
    set ::_catmgr_input_result ""
    
    set bf [ttk::frame $w.bf]
    pack $bf -fill x -padx 10 -pady 10
    ttk::button $bf.ok -text "OK" -command {
        set ::_catmgr_input_result $::_catmgr_input_value
        destroy .catmgr_input
    }
    ttk::button $bf.cancel -text "Cancel" -command {
        set ::_catmgr_input_result ""
        destroy .catmgr_input
    }
    pack $bf.ok $bf.cancel -side right -padx 4
    
    bind $w <Return> "$bf.ok invoke"
    bind $w <Escape> "$bf.cancel invoke"
    
    focus $w.ent
    $w.ent selection range 0 end
    
    # Fenster sichtbar machen bevor grab gesetzt wird
    update
    catch {grab $w}
    tkwait window $w
    
    return $::_catmgr_input_result
}

proc _catmgr_pick_category {title prompt categories} {
    # Modaler Auswahl-Dialog mit Listbox. Liefert gewaehlte Kategorie oder "".
    set w .catmgr_pick
    if {[winfo exists $w]} { destroy $w }
    toplevel $w
    wm title $w $title
    wm transient $w .catmgr
    wm geometry $w 540x420
    
    ttk::label $w.lbl -text $prompt -padding 10 -justify left
    pack $w.lbl -anchor w -fill x
    
    set lf [ttk::frame $w.lf]
    pack $lf -fill both -expand 1 -padx 10 -pady 5
    
    listbox $lf.lst -yscrollcommand "$lf.sb set" -font {Sans 10}
    ttk::scrollbar $lf.sb -orient vertical -command "$lf.lst yview"
    pack $lf.sb -side right -fill y
    pack $lf.lst -side left -fill both -expand 1
    
    foreach cat $categories {
        $lf.lst insert end $cat
    }
    $lf.lst selection set 0
    
    set ::_catmgr_pick_result ""
    
    set bf [ttk::frame $w.bf]
    pack $bf -fill x -padx 10 -pady 10
    ttk::button $bf.ok -text "OK" -command "
        set sel \[$lf.lst curselection\]
        if {\$sel ne {}} {
            set ::_catmgr_pick_result \[$lf.lst get \$sel\]
        }
        destroy $w
    "
    ttk::button $bf.cancel -text "Cancel" -command "destroy $w"
    pack $bf.ok $bf.cancel -side right -padx 4
    
    bind $lf.lst <Double-Button-1> "$bf.ok invoke"
    bind $w <Return> "$bf.ok invoke"
    bind $w <Escape> "$bf.cancel invoke"
    
    focus $lf.lst
    
    # Fenster sichtbar machen bevor grab gesetzt wird
    update
    catch {grab $w}
    tkwait window $w
    
    return $::_catmgr_pick_result
}

proc _catmgr_refresh_combobox {} {
    # Combobox im Hauptfenster aktualisieren (falls vorhanden)
    if {![winfo exists .toolbar.cat_combo]} return
    set cats [list]
    foreach row [::glossdb allrows -as lists {SELECT DISTINCT category FROM terms ORDER BY category}] {
        lappend cats [lindex $row 0]
    }
    .toolbar.cat_combo configure -values $cats
}

proc load_all_terms {} {
    set tv .paned.left.tree.tv
    
    # Treeview leeren
    $tv delete [$tv children {}]
    
    # Kategorien laden
    set categories [::glossdb allrows -as dicts {
        SELECT DISTINCT category FROM terms ORDER BY category COLLATE NOCASE
    }]
    
    # Combobox aktualisieren
    set cat_list {}
    foreach cat $categories {
        lappend cat_list [dict get $cat category]
    }
    .paned.left.catframe.combo configure -values $cat_list
    
    # Treeview mit Kategorien + Begriffen fuellen
    set total_terms 0
    foreach cat $categories {
        set cat_name [dict get $cat category]
        
        # Kategorie als Parent-Node
        set cat_id [$tv insert {} end -text $cat_name -tags category]
        
        # Begriffe dieser Kategorie als Children
        set terms [::glossdb allrows -as dicts {
            SELECT id, term FROM terms 
            WHERE category = :cat_name 
            ORDER BY term COLLATE NOCASE
        }]
        
        foreach term $terms {
            set term_name [dict get $term term]
            set term_id [dict get $term id]
            $tv insert $cat_id end -text $term_name -tags [list term $term_id]
            incr total_terms
        }
    }
    
    # Tags fuer Styling
    $tv tag configure category -font {TkDefaultFont 10 bold} -foreground #0066cc
    $tv tag configure term -font {TkDefaultFont 10}
    
    set ::status_text "Database: [file tail $::db_path] ($total_terms terms, [llength $categories] categories)"
}

# Term auswaehlen (Treeview)
proc on_term_select {} {
    set tv .paned.left.tree.tv
    set sel [$tv selection]
    if {$sel eq ""} return
    
    set tags [$tv item $sel -tags]
    
    # Nur wenn ein Term (nicht Kategorie) gewaehlt wurde
    if {[lsearch $tags "term"] >= 0} {
        # Tag ist {term <id>} — eindeutig identifizieren
        set idx [expr {[lsearch $tags "term"] + 1}]
        set term_id [lindex $tags $idx]
        if {$term_id ne ""} {
            display_term_by_id $term_id
        } else {
            # Fallback (alte Daten, kein ID-Tag)
            set term [$tv item $sel -text]
            display_term_by_name $term
        }
    }
}

# Kategorie auswaehlen (Combobox)
proc on_category_select {} {
    if {![info exists ::selected_category] || $::selected_category eq ""} return
    
    set tv .paned.left.tree.tv
    
    # Finde Kategorie-Node und expandiere
    foreach cat_id [$tv children {}] {
        if {[$tv item $cat_id -text] eq $::selected_category} {
            $tv see $cat_id
            $tv item $cat_id -open true
            
            # Ersten Term dieser Kategorie waehlen
            set children [$tv children $cat_id]
            if {[llength $children] > 0} {
                $tv selection set [lindex $children 0]
                $tv see [lindex $children 0]
                on_term_select
            }
            break
        }
    }
}

# Term anzeigen (TDBC)
# Fügt Text in Text-Widget ein und hebt `inline-code` markierte Stellen
# als code-Tag hervor. Backticks selbst werden nicht angezeigt.
# Beispiel:
#   "Use `proc name {} {body}`" → "Use " (plain) + "proc name {} {body}" (code-Tag)
proc _insert_with_backticks {textWidget content {baseTags ""}} {
    # Split an `...`-Sequenzen und Plaintext-Strecken
    # Regex: matched entweder einen Backtick-Block oder einen Nicht-Backtick-String
    set parts [regexp -all -inline {`[^`]+`|[^`]+} $content]
    foreach part $parts {
        if {[string length $part] >= 2 && [string index $part 0] eq "`" && [string index $part end] eq "`"} {
            # Code-Inline: Backticks abschneiden, mit code-Tag einfügen
            set inner [string range $part 1 end-1]
            if {$baseTags eq ""} {
                $textWidget insert end $inner code
            } else {
                $textWidget insert end $inner [list code {*}$baseTags]
            }
        } else {
            # Plain text
            if {$baseTags eq ""} {
                $textWidget insert end $part
            } else {
                $textWidget insert end $part $baseTags
            }
        }
    }
}

proc display_term {term} {
    # Backward-compatible Eintragspunkt: nimmt einen Term-Namen an,
    # loest Mehrdeutigkeiten ggf. ueber einen Auswahldialog auf, und
    # delegiert dann an display_term_by_id.
    display_term_by_name $term
}

proc display_term_by_name {term} {
    # Suche alle Eintraege mit diesem Namen (es koennen mehrere sein,
    # in unterschiedlichen Kategorien).
    set results [::glossdb allrows -as dicts {
        SELECT id, category FROM terms WHERE term = :term ORDER BY category
    }]
    
    if {[llength $results] == 0} {
        return
    }
    
    if {[llength $results] == 1} {
        # Eindeutig
        display_term_by_id [dict get [lindex $results 0] id]
        return
    }
    
    # Mehrdeutig: Auswahldialog zeigen
    set chosen_id [_choose_disambiguation $term $results]
    if {$chosen_id ne ""} {
        display_term_by_id $chosen_id
    }
}

proc _choose_disambiguation {term results} {
    # Kleiner Toplevel mit Listbox aller Kategorien des mehrdeutigen Terms.
    # Gibt die ID des gewaehlten Eintrags zurueck, oder "" bei Abbruch.
    set w .disambig
    if {[winfo exists $w]} { destroy $w }
    toplevel $w
    wm title $w "'$term' — choose category"
    wm transient $w .
    wm geometry $w 480x260
    
    ttk::label $w.lbl -text "The term '$term' exists in multiple categories:" \
        -padding 10
    pack $w.lbl -anchor w
    
    listbox $w.lst -height 8 -font {Sans 10}
    pack $w.lst -fill both -expand 1 -padx 10 -pady 5
    
    foreach r $results {
        $w.lst insert end [dict get $r category]
    }
    $w.lst selection set 0
    
    set ::_disambig_choice ""
    
    set bf [ttk::frame $w.bf]
    pack $bf -fill x -padx 10 -pady 10
    ttk::button $bf.ok -text "OK" -command "
        set sel \[$w.lst curselection\]
        if {\$sel ne {}} {
            set ::_disambig_choice \[dict get \[lindex {$results} \$sel\] id\]
        }
        destroy $w
    "
    ttk::button $bf.cancel -text "Cancel" -command "destroy $w"
    pack $bf.ok $bf.cancel -side left -padx 4
    
    bind $w.lst <Double-Button-1> "$bf.ok invoke"
    bind $w <Return>              "$bf.ok invoke"
    bind $w <Escape>              "$bf.cancel invoke"
    
    # Fenster sichtbar machen bevor grab gesetzt wird
    update
    catch {grab $w}
    tkwait window $w
    
    set chosen $::_disambig_choice
    set ::_disambig_choice ""
    return $chosen
}

proc display_term_by_id {id} {
    set t .paned.right.text
    $t configure -state normal
    $t delete 1.0 end
    
    set results [::glossdb allrows -as dicts {
        SELECT * FROM terms WHERE id = :id
    }]
    
    if {[llength $results] == 0} {
        $t configure -state disabled
        return
    }
    
    set row [lindex $results 0]
    set ::current_term_id [dict get $row id]
    
    # Title
    $t insert end "[dict get $row term]\n" title
    $t insert end "\n"
    
    # Category
    $t insert end "Category: " note
    $t insert end "[dict get $row category]\n" category
    $t insert end "\n"
    
    # EN Definition
    if {[dict exists $row en_definition] && [dict get $row en_definition] ne ""} {
        $t insert end "English\n" heading
        $t insert end "[string repeat - 60]\n" note
        _insert_with_backticks $t [dict get $row en_definition]
        $t insert end "\n\n"
    }
    
    # DE Definition
    if {[dict exists $row de_definition] && [dict get $row de_definition] ne ""} {
        $t insert end "Deutsch\n" heading
        $t insert end "[string repeat - 60]\n" note
        _insert_with_backticks $t [dict get $row de_definition]
        $t insert end "\n\n"
    }
    
    # EN Example
    if {[dict exists $row en_example] && [dict get $row en_example] ne ""} {
        $t insert end "Example (EN)\n" heading
        $t insert end "[string repeat - 60]\n" note
        $t insert end "[dict get $row en_example]\n" example
        $t insert end "\n"
    }
    
    # DE Example
    if {[dict exists $row de_example] && [dict get $row de_example] ne ""} {
        $t insert end "Beispiel (DE)\n" heading
        $t insert end "[string repeat - 60]\n" note
        $t insert end "[dict get $row de_example]\n" example
        $t insert end "\n"
    }
    
    # Related (mit klickbaren Links)
    if {[dict exists $row related_terms] && [dict get $row related_terms] ne ""} {
        $t insert end "Related terms: " note
        
        # Terms splitten (durch Komma getrennt)
        set related_list [split [dict get $row related_terms] ","]
        set first 1
        foreach related_term $related_list {
            set related_term [string trim $related_term]
            if {$related_term eq ""} continue
            
            if {!$first} {
                $t insert end ", " {}
            }
            set first 0
            
            # Jeder Term mit eigenem clickable Tag
            set tag_name "rellink_$related_term"
            $t insert end $related_term [list link $tag_name]
            $t tag bind $tag_name <Button-1> [list navigate_to_term $related_term]
            $t tag bind $tag_name <Enter> [list $t configure -cursor hand2]
            $t tag bind $tag_name <Leave> [list $t configure -cursor {}]
        }
        $t insert end "\n\n"
    }
    
    # See Also (mit klickbaren Links analog zu Related Terms)
    if {[dict exists $row see_also] && [dict get $row see_also] ne ""} {
        $t insert end "Siehe auch: " note
        
        # Komma- oder Semikolon-getrennte Liste, Manpage-Suffixe wie (n) entfernen
        set see_raw [dict get $row see_also]
        set see_split [regexp -all -inline {[^,;]+} $see_raw]
        set first 1
        foreach see_term $see_split {
            set see_term [string trim $see_term]
            # Manpage-Suffix wie "(n)" oder "(3tcl)" entfernen für die Suche
            set see_clean [regsub {\s*\([^)]*\)\s*$} $see_term ""]
            if {$see_clean eq ""} continue
            
            if {!$first} {
                $t insert end ", " {}
            }
            set first 0
            
            # Eigenes Tag pro Eintrag, Klick navigiert
            set tag_name "seelink_$see_clean"
            $t insert end $see_term [list link $tag_name]
            $t tag bind $tag_name <Button-1> [list navigate_to_term $see_clean]
            $t tag bind $tag_name <Enter> [list $t configure -cursor hand2]
            $t tag bind $tag_name <Leave> [list $t configure -cursor {}]
        }
        $t insert end "\n\n"
    }
    
    # Notes
    if {[dict exists $row notes] && [dict get $row notes] ne ""} {
        $t insert end "Notizen\n" heading
        $t insert end "[dict get $row notes]\n" note
    }
    
    # Treffer-Hervorhebung wenn aktive Suche
    if {[info exists ::search_query] && $::search_query ne ""} {
        _highlight_search_hits $t $::search_query
    }
    
    $t configure -state disabled
}

# Hebt alle Vorkommen des Suchstrings im Text-Widget hervor.
# Erkennt einfache FTS5-Token: trennt an Whitespace, ignoriert Operatoren
# (AND, OR, NOT, "), behandelt Wildcards (term*) als Stamm-Match.
proc _highlight_search_hits {t query} {
    # Tag konfigurieren falls nicht schon vorhanden
    if {"hit" ni [$t tag names]} {
        $t tag configure hit -background "#fff8a0" -foreground black
    }
    
    # Tokens aus Query extrahieren (FTS5-Operatoren rauswerfen)
    set tokens {}
    foreach raw [regexp -all -inline {"[^"]+"|\S+} $query] {
        set token [string trim $raw "\""]
        if {$token in {AND OR NOT and or not}} continue
        # Wildcard-Sternchen abschneiden fuer Stamm-Match
        set token [string trim $token "*"]
        if {[string length $token] >= 2} {
            lappend tokens $token
        }
    }
    
    # Jeden Token im Text suchen + markieren
    foreach token $tokens {
        set start 1.0
        while 1 {
            set pos [$t search -nocase -count len $token $start end]
            if {$pos eq ""} break
            $t tag add hit $pos "$pos + $len chars"
            set start "$pos + $len chars"
        }
    }
}

# Suche (TDBC) - FTS5 Volltext-Suche
proc search_terms {} {
    if {![info exists ::search_query] || $::search_query eq ""} return
    
    set tv .paned.left.tree.tv
    $tv delete [$tv children {}]
    
    # FTS5-Suche (unterstuetzt AND, OR, NOT)
    set count 0
    
    # Versuche FTS5, bei Fehler fallback auf LIKE
    if {[catch {
        set results [::glossdb allrows -as dicts {
            SELECT terms.id, terms.term, terms.category
            FROM terms_fts
            JOIN terms ON terms_fts.rowid = terms.id
            WHERE terms_fts MATCH :::search_query
            ORDER BY terms.term COLLATE NOCASE
        }]
    } err]} {
        # Fallback: LIKE-Suche
        set query "%$::search_query%"
        set results [::glossdb allrows -as dicts {
            SELECT id, term, category FROM terms
            WHERE term LIKE :query
               OR en_definition LIKE :query
               OR de_definition LIKE :query
            ORDER BY term COLLATE NOCASE
        }]
    }
    
    # Gruppiere Ergebnisse nach Kategorie
    array set cat_terms {}
    foreach row $results {
        set cat [dict get $row category]
        if {![info exists cat_terms($cat)]} {
            set cat_terms($cat) {}
        }
        lappend cat_terms($cat) $row
        incr count
    }
    
    # Treeview mit Ergebnissen fuellen
    foreach cat [lsort [array names cat_terms]] {
        set cat_id [$tv insert {} end -text $cat -tags category]
        
        foreach term $cat_terms($cat) {
            set term_name [dict get $term term]
            set term_id [dict get $term id]
            $tv insert $cat_id end -text $term_name -tags [list term $term_id]
        }
        
        # Expandiere Kategorie
        $tv item $cat_id -open true
    }
    
    set ::status_text "Search: '$::search_query' ($count results) - Syntax: AND, OR, NOT"
}

proc clear_search {} {
    set ::search_query ""
    set ::selected_category ""
    load_all_terms
}

proc focus_search {} {
    focus .search.entry
    .search.entry selection range 0 end
}

# Search-Hilfe
proc show_search_help {} {
    set msg "FTS5 Full-Text Search - Syntax\n"
    append msg "[string repeat = 40]\n\n"
    append msg "Simple search:\n"
    append msg "  namespace     - Finds 'namespace'\n\n"
    append msg "AND combination:\n"
    append msg "  namespace AND command\n"
    append msg "  namespace command     (space = AND)\n\n"
    append msg "OR combination:\n"
    append msg "  namespace OR procedure\n\n"
    append msg "NOT exclusion:\n"
    append msg "  tcl NOT tk\n\n"
    append msg "Phrase search:\n"
    append msg "  \"event loop\"   - Exact phrase\n\n"
    append msg "Prefix:\n"
    append msg "  name*         - Anything starting with 'name'\n\n"
    append msg "Combinations:\n"
    append msg "  (namespace OR proc) AND variable\n"
    
    tk_messageBox -type ok -icon info -title "Search Help" -message $msg
}

# Navigation (Treeview)
proc prev_term {} {
    set tv .paned.left.tree.tv
    set sel [$tv selection]
    if {$sel eq ""} return
    
    set prev [$tv prev $sel]
    if {$prev ne ""} {
        $tv selection set $prev
        $tv see $prev
        on_term_select
    }
}

proc next_term {} {
    set tv .paned.left.tree.tv
    set sel [$tv selection]
    if {$sel eq ""} return
    
    set next [$tv next $sel]
    if {$next ne ""} {
        $tv selection set $next
        $tv see $next
        on_term_select
    }
}

# Edit-Dialog erstellen
proc create_edit_dialog {mode {term_id ""}} {
    # mode: "new" oder "edit"
    
    # Wenn Dialog schon existiert, schliessen
    if {[winfo exists .edit]} {
        destroy .edit
    }
    
    toplevel .edit
    wm title .edit [expr {$mode eq "new" ? "New Term" : "Edit Term"}]
    wm geometry .edit 800x750
    wm minsize .edit 700 650
    
    # Bei Edit: Daten laden
    set data [dict create term "" category "" en_definition "" de_definition "" \
        en_example "" de_example "" tcl_version "" related_terms "" see_also "" notes ""]
    
    if {$mode eq "edit" && $term_id ne ""} {
        set results [::glossdb allrows -as dicts {SELECT * FROM terms WHERE id = :term_id}]
        if {[llength $results] > 0} {
            set data [lindex $results 0]
        }
    }
    
    # Scrollbares Frame
    ttk::frame .edit.main
    pack .edit.main -fill both -expand 1 -padx 10 -pady 10
    
    # Grid layout
    set row 0
    
    # Term (erforderlich)
    ttk::label .edit.main.lbl_term -text "Term:*" -font {TkDefaultFont 10 bold}
    ttk::entry .edit.main.ent_term -textvariable ::edit_term -width 50
    grid .edit.main.lbl_term -row $row -column 0 -sticky w -pady 2
    grid .edit.main.ent_term -row $row -column 1 -sticky ew -pady 2
    incr row
    
    # Kategorie (Combobox - freitext erlaubt)
    ttk::label .edit.main.lbl_cat -text "Category:* (new allowed)" -font {TkDefaultFont 10 bold}
    ttk::combobox .edit.main.cmb_cat -textvariable ::edit_category -width 48
    # -state default (=normal) erlaubt Freitext, ::edit_category nimmt jeden Wert
    
    # Kategorien laden (zur Auswahl als Vorschlaege)
    set cats [::glossdb allrows -as dicts {SELECT DISTINCT category FROM terms ORDER BY category}]
    set cat_list {}
    foreach cat $cats {
        lappend cat_list [dict get $cat category]
    }
    .edit.main.cmb_cat configure -values $cat_list
    
    grid .edit.main.lbl_cat -row $row -column 0 -sticky w -pady 2
    grid .edit.main.cmb_cat -row $row -column 1 -sticky ew -pady 2
    incr row
    
    # Separator
    ttk::separator .edit.main.sep1 -orient horizontal
    grid .edit.main.sep1 -row $row -column 0 -columnspan 2 -sticky ew -pady 10
    incr row
    
    # EN Definition (Text-Widget)
    ttk::label .edit.main.lbl_en -text "English Definition:*"
    grid .edit.main.lbl_en -row $row -column 0 -sticky nw -pady 2
    incr row
    
    ttk::frame .edit.main.frm_en
    text .edit.main.frm_en.txt -height 5 -width 60 -wrap word \
        -yscrollcommand {.edit.main.frm_en.sb set}
    ttk::scrollbar .edit.main.frm_en.sb -orient vertical \
        -command {.edit.main.frm_en.txt yview}
    pack .edit.main.frm_en.txt -side left -fill both -expand 1
    pack .edit.main.frm_en.sb -side right -fill y
    
    grid .edit.main.frm_en -row $row -column 0 -columnspan 2 -sticky ew -pady 2
    incr row
    
    # DE Definition (Text-Widget)
    ttk::label .edit.main.lbl_de -text "Deutsche Definition:*"
    grid .edit.main.lbl_de -row $row -column 0 -sticky nw -pady 2
    incr row
    
    ttk::frame .edit.main.frm_de
    text .edit.main.frm_de.txt -height 5 -width 60 -wrap word \
        -yscrollcommand {.edit.main.frm_de.sb set}
    ttk::scrollbar .edit.main.frm_de.sb -orient vertical \
        -command {.edit.main.frm_de.txt yview}
    pack .edit.main.frm_de.txt -side left -fill both -expand 1
    pack .edit.main.frm_de.sb -side right -fill y
    
    grid .edit.main.frm_de -row $row -column 0 -columnspan 2 -sticky ew -pady 2
    incr row
    
    # Separator
    ttk::separator .edit.main.sep2 -orient horizontal
    grid .edit.main.sep2 -row $row -column 0 -columnspan 2 -sticky ew -pady 10
    incr row
    
    # EN Example (Text-Widget - optional)
    ttk::label .edit.main.lbl_en_ex -text "English Example (optional):"
    grid .edit.main.lbl_en_ex -row $row -column 0 -sticky nw -pady 2
    incr row
    
    ttk::frame .edit.main.frm_en_ex
    text .edit.main.frm_en_ex.txt -height 3 -width 60 -wrap word \
        -yscrollcommand {.edit.main.frm_en_ex.sb set}
    ttk::scrollbar .edit.main.frm_en_ex.sb -orient vertical \
        -command {.edit.main.frm_en_ex.txt yview}
    pack .edit.main.frm_en_ex.txt -side left -fill both -expand 1
    pack .edit.main.frm_en_ex.sb -side right -fill y
    
    grid .edit.main.frm_en_ex -row $row -column 0 -columnspan 2 -sticky ew -pady 2
    incr row
    
    # DE Example (Text-Widget - optional)
    ttk::label .edit.main.lbl_de_ex -text "Deutsches Beispiel (optional):"
    grid .edit.main.lbl_de_ex -row $row -column 0 -sticky nw -pady 2
    incr row
    
    ttk::frame .edit.main.frm_de_ex
    text .edit.main.frm_de_ex.txt -height 3 -width 60 -wrap word \
        -yscrollcommand {.edit.main.frm_de_ex.sb set}
    ttk::scrollbar .edit.main.frm_de_ex.sb -orient vertical \
        -command {.edit.main.frm_de_ex.txt yview}
    pack .edit.main.frm_de_ex.txt -side left -fill both -expand 1
    pack .edit.main.frm_de_ex.sb -side right -fill y
    
    grid .edit.main.frm_de_ex -row $row -column 0 -columnspan 2 -sticky ew -pady 2
    incr row
    
    # Weitere Felder (optional)
    ttk::label .edit.main.lbl_ver -text "Tcl Version:"
    ttk::entry .edit.main.ent_ver -textvariable ::edit_tcl_version -width 50
    grid .edit.main.lbl_ver -row $row -column 0 -sticky w -pady 2
    grid .edit.main.ent_ver -row $row -column 1 -sticky ew -pady 2
    incr row
    
    ttk::label .edit.main.lbl_rel -text "Related terms:"
    ttk::entry .edit.main.ent_rel -textvariable ::edit_related -width 50
    grid .edit.main.lbl_rel -row $row -column 0 -sticky w -pady 2
    grid .edit.main.ent_rel -row $row -column 1 -sticky ew -pady 2
    incr row
    
    ttk::label .edit.main.lbl_see -text "See also:"
    ttk::entry .edit.main.ent_see -textvariable ::edit_see_also -width 50
    grid .edit.main.lbl_see -row $row -column 0 -sticky w -pady 2
    grid .edit.main.ent_see -row $row -column 1 -sticky ew -pady 2
    incr row
    
    ttk::label .edit.main.lbl_notes -text "Notes:"
    ttk::entry .edit.main.ent_notes -textvariable ::edit_notes -width 50
    grid .edit.main.lbl_notes -row $row -column 0 -sticky w -pady 2
    grid .edit.main.ent_notes -row $row -column 1 -sticky ew -pady 2
    incr row
    
    grid columnconfigure .edit.main 1 -weight 1
    
    # Buttons
    ttk::frame .edit.buttons
    ttk::button .edit.buttons.save -text "Save" \
        -command [list save_term $mode $term_id]
    ttk::button .edit.buttons.cancel -text "Cancel" -command {destroy .edit}
    
    pack .edit.buttons.save -side left -padx 5 -pady 5
    pack .edit.buttons.cancel -side left -padx 5 -pady 5
    pack .edit.buttons -side bottom -fill x
    
    # Daten in Dialog laden
    set ::edit_term [expr {[dict exists $data term] ? [dict get $data term] : ""}]
    set ::edit_category [expr {[dict exists $data category] ? [dict get $data category] : ""}]
    set ::edit_tcl_version [expr {[dict exists $data tcl_version] ? [dict get $data tcl_version] : ""}]
    set ::edit_related [expr {[dict exists $data related_terms] ? [dict get $data related_terms] : ""}]
    set ::edit_see_also [expr {[dict exists $data see_also] ? [dict get $data see_also] : ""}]
    set ::edit_notes [expr {[dict exists $data notes] ? [dict get $data notes] : ""}]
    
    if {[dict exists $data en_definition]} {
        .edit.main.frm_en.txt insert 1.0 [dict get $data en_definition]
    }
    if {[dict exists $data de_definition]} {
        .edit.main.frm_de.txt insert 1.0 [dict get $data de_definition]
    }
    if {[dict exists $data en_example]} {
        .edit.main.frm_en_ex.txt insert 1.0 [dict get $data en_example]
    }
    if {[dict exists $data de_example]} {
        .edit.main.frm_de_ex.txt insert 1.0 [dict get $data de_example]
    }
    
    # Focus auf Term-Entry
    focus .edit.main.ent_term
}

# Term speichern (INSERT oder UPDATE)
proc save_term {mode term_id} {
    # Validierung
    if {![info exists ::edit_term] || [string trim $::edit_term] eq ""} {
        tk_messageBox -type ok -icon error -parent .edit \
            -message "Error: term cannot be empty!"
        return
    }
    
    if {![info exists ::edit_category] || [string trim $::edit_category] eq ""} {
        tk_messageBox -type ok -icon error -parent .edit \
            -message "Error: category cannot be empty!"
        return
    }
    
    set en_def [string trim [.edit.main.frm_en.txt get 1.0 end]]
    set de_def [string trim [.edit.main.frm_de.txt get 1.0 end]]
    
    if {$en_def eq "" || $de_def eq ""} {
        tk_messageBox -type ok -icon error -parent .edit \
            -message "Error: EN and DE definitions are required!"
        return
    }
    
    # Text-Widget Inhalte auslesen
    set en_example [string trim [.edit.main.frm_en_ex.txt get 1.0 end]]
    set de_example [string trim [.edit.main.frm_de_ex.txt get 1.0 end]]
    
    # NULL fuer leere Werte
    set tcl_ver [expr {[info exists ::edit_tcl_version] && $::edit_tcl_version ne "" ? $::edit_tcl_version : ""}]
    set related [expr {[info exists ::edit_related] && $::edit_related ne "" ? $::edit_related : ""}]
    set see_also [expr {[info exists ::edit_see_also] && $::edit_see_also ne "" ? $::edit_see_also : ""}]
    set notes [expr {[info exists ::edit_notes] && $::edit_notes ne "" ? $::edit_notes : ""}]
    
    # Unique-Check bei NEW: term + category zusammen muessen einzigartig sein
    if {$mode eq "new"} {
        set term_check $::edit_term
        set cat_check $::edit_category
        set existing [::glossdb allrows -as dicts {
            SELECT id FROM terms WHERE term = :term_check AND category = :cat_check
        }]
        if {[llength $existing] > 0} {
            tk_messageBox -type ok -icon error -parent .edit \
                -message "Term '$::edit_term' already exists in category '$::edit_category'.\n\nThe same term name in a different category is allowed."
            return
        }
    }
    
    # INSERT oder UPDATE
    if {$mode eq "new"} {
        # INSERT
        set stmt [::glossdb prepare {
            INSERT INTO terms (term, category, en_definition, de_definition, 
                en_example, de_example, tcl_version, related_terms, see_also, notes)
            VALUES (:term, :category, :en_def, :de_def, :en_example, :de_example,
                :tcl_ver, :related, :see_also, :notes)
        }]
        
        # TDBC execute mit Dictionary
        $stmt execute [dict create \
            term $::edit_term \
            category $::edit_category \
            en_def $en_def \
            de_def $de_def \
            en_example $en_example \
            de_example $de_example \
            tcl_ver $tcl_ver \
            related $related \
            see_also $see_also \
            notes $notes]
        
        $stmt close
        
        set msg "Term '$::edit_term' successfully created!"
    } else {
        # UPDATE
        set stmt [::glossdb prepare {
            UPDATE terms SET
                term = :term,
                category = :category,
                en_definition = :en_def,
                de_definition = :de_def,
                en_example = :en_example,
                de_example = :de_example,
                tcl_version = :tcl_ver,
                related_terms = :related,
                see_also = :see_also,
                notes = :notes
            WHERE id = :term_id
        }]
        
        # TDBC execute mit Dictionary
        $stmt execute [dict create \
            term $::edit_term \
            category $::edit_category \
            en_def $en_def \
            de_def $de_def \
            en_example $en_example \
            de_example $de_example \
            tcl_ver $tcl_ver \
            related $related \
            see_also $see_also \
            notes $notes \
            term_id $term_id]
        
        $stmt close
        
        set msg "Term '$::edit_term' successfully updated!"
    }
    
    # Dialog schliessen
    destroy .edit
    
    # Treeview neu laden
    load_all_terms
    
    # Erfolg-Meldung
    set ::status_text $msg
    tk_messageBox -type ok -icon info -message $msg
}

# Neuer Term
proc new_term {} {
    create_edit_dialog "new"
}

# Term bearbeiten
proc edit_term {} {
    set tv .paned.left.tree.tv
    set sel [$tv selection]
    
    if {$sel eq ""} {
        tk_messageBox -type ok -icon warning \
            -message "Please select a term first!"
        return
    }
    
    set tags [$tv item $sel -tags]
    
    # Nur Terms (nicht Kategorien) koennen bearbeitet werden
    if {[lsearch $tags "term"] < 0} {
        tk_messageBox -type ok -icon warning \
            -message "Please select a term (not a category)!"
        return
    }
    
    # Term-ID aus Tags extrahieren
    set term_id [lindex $tags end]
    
    create_edit_dialog "edit" $term_id
}

# Navigation zu einem Term (fuer Related Terms Links)
proc navigate_to_term {term_name} {
    # Term in DB suchen — kann mehrere Treffer geben (mehrdeutig)
    set results [::glossdb allrows -as dicts {
        SELECT id, category FROM terms WHERE term = :term ORDER BY category
    } [dict create term $term_name]]
    
    if {[llength $results] == 0} {
        tk_messageBox -type ok -icon warning \
            -message "Term '$term_name' not found!"
        return
    }
    
    if {[llength $results] == 1} {
        set chosen_id [dict get [lindex $results 0] id]
    } else {
        # Mehrdeutig: Auswahldialog
        set chosen_id [_choose_disambiguation $term_name $results]
        if {$chosen_id eq ""} {
            return  ;# User hat abgebrochen
        }
    }
    
    # Kategorie aus dem Resultat herausfinden
    set chosen_category ""
    foreach r $results {
        if {[dict get $r id] == $chosen_id} {
            set chosen_category [dict get $r category]
            break
        }
    }
    
    # Kategorie in Treeview expandieren + Term selektieren
    set tv .paned.left.tree.tv
    set cat_items [$tv children {}]
    
    foreach cat_item $cat_items {
        set cat_text [$tv item $cat_item -text]
        if {$cat_text eq $chosen_category} {
            $tv item $cat_item -open true
            
            set term_items [$tv children $cat_item]
            foreach term_item $term_items {
                set tags [$tv item $term_item -tags]
                set item_id [lindex $tags end]
                
                if {$item_id == $chosen_id} {
                    $tv selection set $term_item
                    $tv see $term_item
                    display_term_by_id $chosen_id
                    set ::status_text "Navigated to: $term_name"
                    return
                }
            }
        }
    }
    
    tk_messageBox -type ok -icon warning \
        -message "Term '$term_name' could not be found in the treeview!"
}

# Term loeschen (TDBC)
proc delete_term {} {
    set tv .paned.left.tree.tv
    set sel [$tv selection]
    
    if {$sel eq ""} {
        tk_messageBox -type ok -icon warning \
            -message "Please select a term first!"
        return
    }
    
    set tags [$tv item $sel -tags]
    
    # Nur Terms (nicht Kategorien) koennen geloescht werden
    if {[lsearch $tags "term"] < 0} {
        tk_messageBox -type ok -icon warning \
            -message "Please select a term (not a category)!"
        return
    }
    
    # Term-ID und Name aus Tags/Values extrahieren
    set term_id [lindex $tags end]
    set term_name [$tv item $sel -text]
    
    # Bestaetigungs-Dialog
    set answer [tk_messageBox -type yesno -icon question \
        -title "Delete term?" \
        -message "Really delete the term '$term_name'?\n\nThis cannot be undone!"]
    
    if {$answer ne "yes"} {
        return
    }
    
    # DELETE via TDBC
    if {[catch {
        set stmt [::glossdb prepare {DELETE FROM terms WHERE id = :id}]
        $stmt execute [dict create id $term_id]
        $stmt close
    } err]} {
        tk_messageBox -type ok -icon error \
            -message "Error during delete:\n$err"
        return
    }
    
    # Treeview aktualisieren (Term entfernen)
    $tv delete $sel
    
    # Text-Widget leeren
    .paned.right.text delete 1.0 end
    
    # Status aktualisieren
    set ::status_text "Term '$term_name' was deleted"
    set ::current_term_id ""
    
    tk_messageBox -type ok -icon info \
        -message "Term '$term_name' was successfully deleted."
}

# Kategorien anzeigen (TDBC)
proc show_categories {} {
    toplevel .cat
    wm title .cat "Categories"
    wm geometry .cat 400x500
    
    ttk::frame .cat.list
    listbox .cat.list.lb -yscrollcommand {.cat.list.sb set}
    ttk::scrollbar .cat.list.sb -orient vertical -command {.cat.list.lb yview}
    
    pack .cat.list.lb -side left -fill both -expand 1
    pack .cat.list.sb -side right -fill y
    pack .cat.list -fill both -expand 1
    
    # TDBC: allrows -as dicts
    set results [::glossdb allrows -as dicts {SELECT DISTINCT category FROM terms ORDER BY category}]
    foreach row $results {
        .cat.list.lb insert end [dict get $row category]
    }
    
    ttk::button .cat.close -text "Close" -command {destroy .cat}
    pack .cat.close -pady 5
}

# Statistik (TDBC)
proc show_statistics {} {
    # TDBC: allrows -as dicts
    set stats [::glossdb allrows -as dicts {SELECT * FROM stats}]
    if {[llength $stats] > 0} {
        set row [lindex $stats 0]
        set msg "Database Statistics\n"
        append msg "[string repeat = 40]\n\n"
        append msg "Total terms:          [dict get $row total_terms]\n"
        append msg "Categories:           [dict get $row total_categories]\n"
        append msg "Bilingual terms:      [dict get $row bilingual_terms]\n"
        append msg "With examples:        [dict get $row terms_with_examples]\n"
        
        tk_messageBox -type ok -icon info -title "Statistics" -message $msg
    }
}

# Export
proc export_database {} {
    if {![llength [info commands ::glossdb]]} {
        tk_messageBox -type ok -icon warning -message "Please open a database first!"
        return
    }
    
    # Format-Auswahl - was soll exportiert werden?
    set fmt [_choose_export_format]
    if {$fmt eq ""} { return }
    
    # File-Dialog
    set filename [tk_getSaveFile -defaultextension ".md" \
        -filetypes {{"Markdown" {.md}} {"All Files" {*}}} \
        -title "Export to Markdown ($fmt)"]
    
    if {$filename eq ""} {
        return
    }
    
    # Watch-Cursor waehrend langer Operation
    . configure -cursor watch
    update idletasks
    
    set ::status_text "Exportiere... bitte warten"
    
    # Export-Daten sammeln
    if {[catch {
        set results [::glossdb allrows -as dicts {
            SELECT term, category, en_definition, de_definition, 
                   en_example, de_example, related_terms, see_also
            FROM terms
            ORDER BY category, term
        }]
        
        # MD-Datei schreiben
        set fd [open $filename w]
        fconfigure $fd -encoding utf-8
        
        if {$fmt eq "import"} {
            _export_md_importable $fd $results
        } else {
            _export_md_standard $fd $results
        }
        
        close $fd
        
        # Cursor zurueck + Status
        . configure -cursor ""
        set ::status_text "Export fertig: [file tail $filename] ([llength $results] Eintraege)"
        
        tk_messageBox -type ok -icon info \
            -message "Export erfolgreich!\n\nDatei: $filename\nEintraege: [llength $results]\nFormat: $fmt"
        
    } err]} {
        # Cursor zurueck auch im Fehlerfall
        . configure -cursor ""
        set ::status_text "Export-Fehler"
        tk_messageBox -type ok -icon error -message "Export-Fehler:\n$err"
    }
}

# Auswahl-Dialog: welches Export-Format?
proc _choose_export_format {} {
    set ::_export_choice ""
    
    toplevel .expfmt
    wm title .expfmt "Export-Format"
    wm resizable .expfmt 0 0
    wm transient .expfmt .
    
    ttk::frame .expfmt.f -padding 12
    pack .expfmt.f -fill both -expand 1
    
    ttk::label .expfmt.f.lbl -text "How should the Markdown file be formatted?" \
        -font {TkDefaultFont 10 bold}
    pack .expfmt.f.lbl -anchor w -pady {0 8}
    
    ttk::radiobutton .expfmt.f.r1 \
        -text "Standard - readable (### Term, **EN:**, **DE:**)" \
        -variable ::_export_choice -value "standard"
    ttk::radiobutton .expfmt.f.r2 \
        -text "Import-compatible (## Category, **Term**, - EN:, - DE:)" \
        -variable ::_export_choice -value "import"
    
    pack .expfmt.f.r1 .expfmt.f.r2 -anchor w -pady 2
    
    set ::_export_choice "standard"
    
    ttk::frame .expfmt.f.btns
    pack .expfmt.f.btns -fill x -pady {12 0}
    ttk::button .expfmt.f.btns.ok -text "Export" -command {destroy .expfmt}
    ttk::button .expfmt.f.btns.cancel -text "Cancel" -command {set ::_export_choice ""; destroy .expfmt}
    pack .expfmt.f.btns.cancel -side right -padx {4 0}
    pack .expfmt.f.btns.ok -side right
    
    bind .expfmt <Return> {destroy .expfmt}
    bind .expfmt <Escape> {set ::_export_choice ""; destroy .expfmt}
    
    grab .expfmt
    tkwait window .expfmt
    
    return $::_export_choice
}

# Schreibt License/Acknowledgment-Block ans Ende der MD.
# Wird von beiden Export-Profilen aufgerufen.
proc _write_license_footer {fd} {
    puts $fd ""
    puts $fd "---"
    puts $fd ""
    puts $fd "## License"
    puts $fd ""
    puts $fd "This glossary content is licensed under"
    puts $fd "\[$::glossary_license\]($::glossary_license_url)"
    puts $fd "unless noted otherwise."
    puts $fd ""
    puts $fd "(c) $::glossary_copyright_year $::glossary_author"
    puts $fd ""
    puts $fd "Tcl code snippets shown as examples are released to the"
    puts $fd "public domain (CC0 1.0) and may be used freely."
    puts $fd ""
    puts $fd "## Acknowledgments"
    puts $fd ""
    puts $fd "Some definitions in this glossary draw on terminology and"
    puts $fd "wording from the official Tcl/Tk documentation, distributed"
    puts $fd "under the Tcl License (a BSD-style permissive license)."
    puts $fd "The following copyright notices apply to that material:"
    puts $fd ""
    puts $fd "- Copyright (c) Regents of the University of California"
    puts $fd "- Copyright (c) Sun Microsystems, Inc."
    puts $fd "- Copyright (c) Scriptics Corporation"
    puts $fd "- Copyright (c) ActiveState Corporation"
    puts $fd "- Copyright (c) and other parties"
    puts $fd ""
    puts $fd "Full Tcl License text:"
    puts $fd "<https://www.tcl-lang.org/software/tcltk/license.html>"
    puts $fd ""
}

# Standard-Format (lesbar, was die alte Variante war)
proc _export_md_standard {fd results} {
    puts $fd "# Tcl/Tk Glossar"
    puts $fd ""
    puts $fd "Export: [clock format [clock seconds] -format {%Y-%m-%d %H:%M:%S}]"
    puts $fd ""
    puts $fd "License: $::glossary_license — see end of document for details."
    puts $fd ""
    puts $fd "---"
    puts $fd ""
    
    set current_cat ""
    foreach row $results {
        set term [dict get $row term]
        set cat [dict get $row category]
        set en_def [expr {[dict exists $row en_definition] ? [dict get $row en_definition] : ""}]
        set de_def [expr {[dict exists $row de_definition] ? [dict get $row de_definition] : ""}]
        
        if {$cat ne $current_cat} {
            puts $fd ""
            puts $fd "## $cat"
            puts $fd ""
            set current_cat $cat
        }
        
        puts $fd "### $term"
        puts $fd ""
        puts $fd "**EN:** $en_def"
        puts $fd ""
        puts $fd "**DE:** $de_def"
        puts $fd ""
        
        if {[dict exists $row en_example] && [dict get $row en_example] ne ""} {
            puts $fd "**Example (EN):**"
            puts $fd "```tcl"
            puts $fd [dict get $row en_example]
            puts $fd "```"
            puts $fd ""
        }
        if {[dict exists $row de_example] && [dict get $row de_example] ne ""} {
            puts $fd "**Beispiel (DE):**"
            puts $fd "```tcl"
            puts $fd [dict get $row de_example]
            puts $fd "```"
            puts $fd ""
        }
        if {[dict exists $row related_terms] && [dict get $row related_terms] ne ""} {
            puts $fd "**Related terms:** [dict get $row related_terms]"
            puts $fd ""
        }
        if {[dict exists $row see_also] && [dict get $row see_also] ne ""} {
            puts $fd "**Siehe auch:** [dict get $row see_also]"
            puts $fd ""
        }
        
        puts $fd "---"
        puts $fd ""
    }
    
    # License/Acknowledgments-Block
    _write_license_footer $fd
}

# Import-kompatibles Format (was tools/import_md.tcl wieder einlesen kann)
# Format:  ## Kategorie
#          
#          **term**
#          - EN: ...
#          - DE: ...
proc _export_md_importable {fd results} {
    puts $fd "# Tcl/Tk Glossar (import-kompatibel)"
    puts $fd ""
    puts $fd "<!-- Export: [clock format [clock seconds] -format {%Y-%m-%d %H:%M:%S}] -->"
    puts $fd "<!-- This file can be re-imported via tools/import_md.tcl. -->"
    puts $fd "<!-- License: $::glossary_license  ($::glossary_license_url) -->"
    puts $fd "<!-- Copyright (c) $::glossary_copyright_year $::glossary_author -->"
    puts $fd ""
    
    set current_cat ""
    foreach row $results {
        set term [dict get $row term]
        set cat [dict get $row category]
        set en_def [expr {[dict exists $row en_definition] ? [dict get $row en_definition] : ""}]
        set de_def [expr {[dict exists $row de_definition] ? [dict get $row de_definition] : ""}]
        
        if {$cat ne $current_cat} {
            puts $fd ""
            puts $fd "## $cat"
            puts $fd ""
            set current_cat $cat
        }
        
        puts $fd "**$term**"
        puts $fd "- EN: $en_def"
        puts $fd "- DE: $de_def"
        puts $fd ""
    }
    
    # License/Acknowledgments-Block
    _write_license_footer $fd
}

# About
proc show_about {} {
    set msg "Tcl/Tk Glossary Manager v1.5\n\n"
    append msg "Features:\n"
    append msg "- Treeview with categories (expand/collapse)\n"
    append msg "- Combobox for quick category selection\n"
    append msg "- FTS5 full-text search (AND, OR, NOT)\n"
    append msg "- Edit dialog (new/edit/delete)\n"
    append msg "- Category manager (rename/merge/delete-empty)\n"
    append msg "- Clickable related terms + See-also (navigation)\n"
    append msg "- Search-hit highlighting in definitions\n"
    append msg "- Backtick code highlighting\n"
    append msg "- Markdown export (standard + import-compatible)\n"
    append msg "- Persistent window geometry\n"
    append msg "- TDBC SQLite3 backend\n"
    append msg "- Compound UNIQUE(term, category) — disambiguation\n\n"
    append msg "(c) 2025-2026"
    
    tk_messageBox -type ok -icon info -title "About" -message $msg
}

# ============================================================
# Window-State persistence (~/.glossary_manager.rc)
# ============================================================

proc _rc_path {} {
    return [file join $::env(HOME) .glossary_manager.rc]
}

# Liest gespeicherten State und wendet wm geometry an.
# Default 900x700 wenn keine rc-Datei vorhanden.
proc _load_window_state {} {
    set path [_rc_path]
    set ::saved_sash 0
    
    if {![file exists $path]} {
        wm geometry . 900x700
        return
    }
    
    if {[catch {
        set fh [open $path r]
        fconfigure $fh -encoding utf-8
        set content [read $fh]
        close $fh
    } err]} {
        puts stderr "rc read failed: $err"
        wm geometry . 900x700
        return
    }
    
    # Format: key=value pro Zeile
    set geom ""
    foreach line [split $content "\n"] {
        set line [string trim $line]
        if {$line eq "" || [string index $line 0] eq "#"} continue
        if {[regexp {^([^=]+)=(.*)$} $line -> k v]} {
            set k [string trim $k]
            set v [string trim $v]
            switch -- $k {
                "geometry" { set geom $v }
                "sash"     { set ::saved_sash $v }
            }
        }
    }
    
    if {$geom ne ""} {
        wm geometry . $geom
    } else {
        wm geometry . 900x700
    }
}

# Wendet die gespeicherte Sash-Position an (NACH create_gui)
proc _restore_sash_position {} {
    if {[info exists ::saved_sash] && $::saved_sash > 0} {
        catch {.paned sashpos 0 $::saved_sash}
    }
}

# Speichert Geometry + Sash-Position und beendet das Programm
proc save_and_exit {} {
    set path [_rc_path]
    
    # Geometrie sammeln
    set geom [wm geometry .]
    set sash 0
    catch { set sash [.paned sashpos 0] }
    
    if {[catch {
        set fh [open $path w]
        fconfigure $fh -encoding utf-8
        puts $fh "# Tcl/Tk Glossary Manager - GUI-State"
        puts $fh "# Wird automatisch beim Beenden geschrieben"
        puts $fh "geometry=$geom"
        puts $fh "sash=$sash"
        close $fh
    } err]} {
        puts stderr "rc write failed: $err"
    }
    
    # DB sauber schliessen
    if {[llength [info commands ::glossdb]]} {
        catch {::glossdb close}
    }
    
    exit
}


# Main
if {[llength $argv] > 0} {
    set db_file [lindex $argv 0]
    if {[file exists $db_file]} {
        connect_db $db_file
    }
}

create_gui

# Sash-Position aus rc-Datei wiederherstellen (muss NACH create_gui+update passieren,
# damit das Paned-Window seine endgueltige Breite hat)
update idletasks
_restore_sash_position

if {[llength [info commands ::glossdb]]} {
    load_all_terms
}
