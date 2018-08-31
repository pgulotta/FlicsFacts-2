import QtQuick 2.9
import QtQuick.Window 2.3
pragma Singleton

QtObject {
    readonly property string questionChar: "\u003f"
    readonly property string backChar: "\u2190"
    readonly property string previousChar: "\u00AB"
    readonly property string nextChar: "\u00BB"
    readonly property string downChar: "\u21e3"
    readonly property string upChar: "\u21e1"
    readonly property string leftChar: "\u21e0"
    readonly property string rightChar: "\u21e2"
    readonly property string checkChar: "\u2713"
    readonly property string circleChar: "\u26aa"
    readonly property string refreshChar: "\u21bb"
    readonly property string menuChar: "\u039E"
    readonly property string primaryColor: "DarkSlateBlue"
    readonly property string accentColor: "MediumSlateBlue"
    readonly property string foregroundColor: "Indigo"
    readonly property string backgroundColor: "Lavender"
    readonly property string defaultTextColor: "White"

    readonly property int invalidItem: -1

    /*
   <  	U+003C (alt-060)	LESS-THAN SIGN//   >  	U+003E (alt-062)	GREATER-THAN SIGN
   ?  	U+003F (alt-063)	QUESTION MARK
⁇  	U+2047 (alt-08263)	DOUBLE QUESTION MARK
⌕  	U+2315 (alt-08981)	TELEPHONE RECORDER  -  does not display
☌  	U+260C (alt-09740)	CONJUNCTION = alchemical symbol for day:  does not display
⚲  	U+26B2 (alt-09906)	NEUTER   does not display
// https://gist.github.com/ivandrofly/0fe20773bd712b303f78

    //  readonly property string menuChar: "\u2261"
*/
}
