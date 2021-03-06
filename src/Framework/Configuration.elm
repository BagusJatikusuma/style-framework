module Framework.Configuration exposing (conf)

{-| List of values that you can change to costumize the aspect of the framwork

This list is inspired by Bulma framework: <https://bulma.io/documentation/overview/variables/>


# Functions

@docs conf

-}

-- 019 import ColorMath.Hex8
-- import Color

import Dict
import Element exposing (rgb255)
import Element.Font as Font
import Framework.Color.Extra
import MyStyle


{-| -}
conf :
    { color :
        { background : Element.Color
        , black : Element.Color
        , black_bis : Element.Color
        , black_ter : Element.Color
        , blue : Element.Color
        , border : Element.Color
        , border_hover : Element.Color
        , code : Element.Color
        , code_background : Element.Color
        , cyan : Element.Color
        , danger : Element.Color
        , dark : Element.Color
        , green : Element.Color
        , grey : Element.Color
        , grey_dark : Element.Color
        , grey_darker : Element.Color
        , grey_light : Element.Color
        , grey_lighter : Element.Color
        , info : Element.Color
        , light : Element.Color
        , link : Element.Color
        , link_active : Element.Color
        , link_active_border : Element.Color
        , link_focus : Element.Color
        , link_focus_border : Element.Color
        , link_hover : Element.Color
        , link_hover_border : Element.Color
        , link_invert : Element.Color
        , link_visited : Element.Color
        , muted : Element.Color
        , orange : Element.Color
        , pre : Element.Color
        , pre_background : Element.Color
        , primary : Element.Color
        , purple : Element.Color
        , red : Element.Color
        , success : Element.Color
        , text : Element.Color
        , text_light : Element.Color
        , text_strong : Element.Color
        , transparent : Element.Color
        , turquoise : Element.Color
        , warning : Element.Color
        , white : Element.Color
        , white_bis : Element.Color
        , white_ter : Element.Color
        , yellow : Element.Color
        }
    , font : { typeface : String, typefaceFallback : Font.Font, url : String }
    , moveDownPlaceHolder : { large : Float, small : Float }
    , size :
        { size1 : Float
        , size2 : Float
        , size3 : Float
        , size4 : Float
        , size5 : Float
        , size6 : Float
        , size7 : Float
        }
    , button :
        { fontSmall : Int
        , fontDefault : Int
        , fontMedium : Int
        , fontLarge : Int
        , fontJumbo : Int
        , paddingXSmall : Int
        , paddingYSmall : Int
        , paddingXDefault : Int
        , paddingYDefault : Int
        , paddingXMedium : Int
        , paddingYMedium : Int
        , paddingXLarge : Int
        , paddingYLarge : Int
        , paddingXJumbo : Int
        , paddingYJumbo : Int
        }
    }
conf =
    { size =
        { size1 = getFloat "size1"
        , size2 = getFloat "size2"
        , size3 = getFloat "size3"
        , size4 = getFloat "size4"
        , size5 = getFloat "size5"
        , size6 = getFloat "size6"
        , size7 = getFloat "size7"
        }
    , color =
        { -- Grey Scale
          black = getColor "black"
        , black_bis = getColor "black_bis"
        , black_ter = getColor "black_ter"
        , grey_darker = getColor "grey_darker"
        , grey_dark = getColor "grey_dark"
        , grey = getColor "grey"
        , grey_light = getColor "grey_light"
        , grey_lighter = getColor "grey_lighter"
        , white_ter = getColor "white_ter"
        , white_bis = getColor "white_bis"
        , white = getColor "white"

        -- Colors
        , orange = getColor "orange"
        , yellow = getColor "yellow"
        , green = getColor "green"
        , turquoise = getColor "turquoise"
        , cyan = getColor "cyan"
        , blue = getColor "blue"
        , purple = getColor "purple"
        , red = getColor "red"

        -- Derived Colors
        , primary = getColor "primary"
        , info = getColor "info"
        , success = getColor "success"
        , warning = getColor "warning"
        , danger = getColor "danger"
        , light = getColor "light"
        , dark = getColor "dark"

        -- Background
        , background = getColor "background"

        -- Border
        , border = getColor "border"
        , border_hover = getColor "border_hover"

        -- Fonts
        , text = getColor "text"
        , text_light = getColor "text_light"
        , text_strong = getColor "text_strong"
        , code = getColor "code"
        , code_background = getColor "code_background"
        , pre = getColor "pre"
        , pre_background = getColor "pre_background"

        -- Links
        , link = getColor "link"
        , link_invert = getColor "link_invert"
        , link_visited = getColor "link_visited"
        , link_hover = getColor "link_hover"
        , link_hover_border = getColor "link_hover_border"
        , link_focus = getColor "link_focus"
        , link_focus_border = getColor "link_focus_border"
        , link_active = getColor "link_active"
        , link_active_border = getColor "link_active_border"

        -- Transparent
        , transparent = getColor "transparent"
        , muted = getColor "muted"
        }
    , moveDownPlaceHolder =
        { large = getFloat "moveDownPlaceHolderLarge"
        , small = getFloat "moveDownPlaceHolderSmall"
        }
    , font =
        { url = getString "font_url"
        , typeface = getString "font_typeface"
        , typefaceFallback = getTypeface "font_typeface_fallback"
        }
    , button =
        { fontSmall = getInt "buttonFontSmall"
        , fontDefault = getInt "buttonFontDefault"
        , fontMedium = getInt "buttonFontMedium"
        , fontLarge = getInt "buttonFontLarge"
        , fontJumbo = getInt "buttonFontJumbo"
        , paddingXSmall = getInt "buttonPaddingXSmall"
        , paddingYSmall = getInt "buttonPaddingYSmall"
        , paddingXDefault = getInt "buttonPaddingXDefault"
        , paddingYDefault = getInt "buttonPaddingYDefault"
        , paddingXMedium = getInt "buttonPaddingXMedium"
        , paddingYMedium = getInt "buttonPaddingYMedium"
        , paddingXLarge = getInt "buttonPaddingXLarge"
        , paddingYLarge = getInt "buttonPaddingYLarge"
        , paddingXJumbo = getInt "buttonPaddingXJumbo"
        , paddingYJumbo = getInt "buttonPaddingYJumbo"
        }
    }


getTypeface : String -> Font.Font
getTypeface key =
    let
        value =
            getString key
    in
    if value == "sans-serif" then
        Font.sansSerif

    else if value == "monospace" then
        Font.monospace

    else if value == "cursive" then
        -- Font.cursive (still not implemented)
        Font.serif

    else
        Font.serif


getString : String -> String
getString key =
    Maybe.withDefault "" (getValue key configuration MyStyle.configuration)


getFloat : String -> Float
getFloat key =
    case String.toFloat <| getString key of
        Just value2 ->
            value2

        Nothing ->
            0


getInt : String -> Int
getInt key =
    round <| getFloat key



{-
   getInt : String -> Int
   getInt key =
       round <| getFloat key
-}
{-

   hexToColor : String -> Element.Color
   hexToColor hex =
       let
           newHex =
               if String.length hex == 6 || String.length hex == 7 then
                   hex ++ "ff"

               else if String.length hex == 3 || String.length hex == 4 then
                   hex ++ "f"

               else
                   hex
       in
       case ColorMath.Hex8.toColor <| newHex of
           Ok value ->
               value

           Err _ ->
               Color.rgb 0x00 0x00 0x00
-}


getColor : String -> Element.Color
getColor key =
    let
        value =
            getString key
    in
    Framework.Color.Extra.hexToColor <| value


getValue :
    comparable
    -> Dict.Dict comparable a
    -> Dict.Dict comparable a
    -> Maybe a
getValue key original replacement =
    let
        repl =
            Dict.get key replacement

        orig =
            Dict.get key original
    in
    case repl of
        Just value ->
            Just value

        Nothing ->
            case orig of
                Just value ->
                    Just value

                Nothing ->
                    Nothing


bulmaColor :
    { black : String
    , black_bis : String
    , black_ter : String
    , blue : String
    , cyan : String
    , green : String
    , grey : String
    , grey_dark : String
    , grey_darker : String
    , grey_light : String
    , grey_lighter : String
    , orange : String
    , purple : String
    , turquoise : String
    , white : String
    , white_bis : String
    , white_ter : String
    , yellow : String
    , red : String
    }
bulmaColor =
    { -- https://bulma.io/documentation/overview/variables/
      black = "#0A0A0A" -- rgb255 10 10 10 -- Color.hsl2ToString 0 0 4
    , black_bis = "#121212" -- rgb255 18 18 18 -- Color.hsl2ToString 0 0 7
    , black_ter = "#242424" -- rgb255 36 36 36 -- Color.hsl2ToString 0 0 14
    , grey_darker = "#363636" -- rgb255 54 54 54 -- Color.hsl2ToString 0 0 21
    , grey_dark = "#4A4A4A" -- rgb255 74 74 74 -- Color.hsl2ToString 0 0 29
    , grey = "#7A7A7A" -- rgb255 122 122 122 -- Color.hsl2ToString 0 0 48
    , grey_light = "#B5B5B5" -- rgb255 181 181 181 -- Color.hsl2ToString 0 0 71
    , grey_lighter = "#DBDBDB" -- rgb255 219 219 219 -- Color.hsl2ToString 0 0 86
    , white_ter = "#F5F5F5" -- rgb255 245 245 245 -- Color.hsl2ToString 0 0 96
    , white_bis = "#FAFAFA" -- rgb255 250 250 250 -- Color.hsl2ToString 0 0 98
    , white = "#FFFFFF" -- rgb255 255 255 255 -- Color.hsl2ToString 0 0 100
    , orange = "#FF470F" -- rgb255 255 71 15 -- Color.hsl2ToString 14 100 53
    , yellow = "#FFDD57" -- rgb255 255 221 87 -- Color.hsl2ToString 48 100 67
    , green = "#23D160" -- rgb255 35 209 96 -- Color.hsl2ToString 141 71 48
    , turquoise = "#00D1B2" -- rgb255 0 209 178 -- Color.hsl2ToString 171 100 41
    , cyan = "#209CEE" -- rgb255 32 156 238 -- Color.hsl2ToString 204 86 53
    , blue = "#3273DC" -- rgb255 50 115 220 -- Color.hsl2ToString 217 71 53
    , purple = "#B86BFF" -- rgb255 138 50 220 -- Color.hsl2ToString 271 100 71
    , red = "#FF3860" -- rgb255 255 56 96 -- Color.hsl2ToString 348 100 61
    }


bulmaSizes :
    { size1 : String
    , size2 : String
    , size3 : String
    , size5 : String
    , size6 : String
    , size7 : String
    , size4 : String
    }
bulmaSizes =
    { size1 = "3.00"
    , size2 = "2.50"
    , size3 = "2.00"
    , size4 = "1.50"
    , size5 = "1.25"
    , size6 = "1.00"
    , size7 = "0.75"
    }


findColorInvert : String -> String
findColorInvert color =
    {- 019
       color
           |> hexToColor
           |> Color.complement
           -- |> ColorMath.Scaling.rotateHue 0.5
           |> ColorMath.Hex8.fromColor
    -}
    "#000000"


configuration : Dict.Dict String String
configuration =
    Dict.fromList
        [ -- Grey Scale
          ( "black", bulmaColor.black )
        , ( "black_bis", bulmaColor.black_bis )
        , ( "black_ter", bulmaColor.black_ter )
        , ( "grey_darker", bulmaColor.grey_darker )
        , ( "grey_dark", bulmaColor.grey_dark )
        , ( "grey", bulmaColor.grey )
        , ( "grey_light", bulmaColor.grey_light )
        , ( "grey_lighter", bulmaColor.grey_lighter )
        , ( "white_ter", bulmaColor.white_ter )
        , ( "white_bis", bulmaColor.white_bis )
        , ( "white", bulmaColor.white )

        -- Colors
        , ( "orange", bulmaColor.orange )
        , ( "yellow", bulmaColor.yellow )
        , ( "green", bulmaColor.green )
        , ( "turquoise", bulmaColor.turquoise )
        , ( "cyan", bulmaColor.cyan )
        , ( "blue", bulmaColor.blue )
        , ( "purple", bulmaColor.purple )
        , ( "red", bulmaColor.red )

        -- Fonts
        --, ( "family-sans-serif", "BlinkMacSystemFont, -apple-system, \"Segoe UI\", \"Roboto\", \"Oxygen\", \"Ubuntu\", \"Cantarell\", \"Fira Sans\", \"Droid Sans\", \"Helvetica Neue\", \"Helvetica\", \"Arial\", sans-serif" )
        --, ( "family-monospace", "monospace" )
        --, ( "render-mode", "optimizeLegibility" )
        --
        , ( "font_url", "https://fonts.googleapis.com/css?family=Noto+Sans" )
        , ( "font_typeface", "Noto Sans" )
        , ( "font_typeface_fallback", "sans-serif" )

        -- Sizes
        , ( "size1", bulmaSizes.size1 )
        , ( "size2", bulmaSizes.size2 )
        , ( "size3", bulmaSizes.size3 )
        , ( "size4", bulmaSizes.size4 )
        , ( "size5", bulmaSizes.size5 )
        , ( "size6", bulmaSizes.size6 )
        , ( "size7", bulmaSizes.size7 )

        -- Misc
        --, ( "weight-light", "300" )
        --, ( "weight-normal", "400" )
        --, ( "weight-medium", "500" )
        --, ( "weight-semibold", "600" )
        --, ( "weight-bold", "700" )
        --, ( "gap", "32px" )
        --, ( "tablet", "769px" )
        --, ( "desktop", "960px + (2 * $gap)" )
        --, ( "widescreen", "1152px + (2 * $gap)" )
        --, ( "widescreen-enabled", "true" )
        --, ( "fullhd", "1344px + (2 * $gap)" )
        --, ( "fullhd-enabled", "true" )
        --, ( "easing", "ease-out" )
        --, ( "radius-small", "2px" )
        --, ( "radius", "3px" )
        --, ( "radius-large", "5px" )
        --, ( "radius-rounded", "290486px" )
        --, ( "speed", "86ms" )
        --, ( "variable-columns", "true" )
        -- Derived Colors
        , ( "primary", bulmaColor.turquoise )
        , ( "info", bulmaColor.cyan )
        , ( "success", bulmaColor.green )
        , ( "warning", bulmaColor.yellow )
        , ( "danger", bulmaColor.red )
        , ( "light", bulmaColor.white_ter )
        , ( "dark", bulmaColor.grey_darker )

        -- Background
        , ( "background", bulmaColor.white_ter )

        -- Border
        , ( "border", bulmaColor.grey_lighter )
        , ( "border-hover", bulmaColor.grey_light )

        -- Fonts
        , ( "text", bulmaColor.grey_dark )
        , ( "text-light", bulmaColor.grey )
        , ( "text-strong", bulmaColor.grey_darker )
        , ( "code", bulmaColor.red )
        , ( "code-background", bulmaColor.white_ter )
        , ( "pre", bulmaColor.grey_dark )
        , ( "pre-background", bulmaColor.white_ter )

        -- Links
        , ( "link", bulmaColor.blue )
        , ( "link_invert", findColorInvert bulmaColor.blue )
        , ( "link_visited", bulmaColor.purple )
        , ( "link_hover", bulmaColor.grey_darker )
        , ( "link_hover_border", bulmaColor.grey_light )
        , ( "link_focus", bulmaColor.grey_darker )
        , ( "link_focus_border", bulmaColor.blue )
        , ( "link_active", bulmaColor.grey_darker )
        , ( "link_active_border", bulmaColor.grey_dark )

        -- Family
        --, ( "family-primary", bulmaColor.family_sans_serif )
        --, ( "family-code", bulmaColor.family_monospace )
        -- Sizes
        , ( "size_small", bulmaSizes.size7 )
        , ( "size_normal", bulmaSizes.size6 )
        , ( "size_medium", bulmaSizes.size5 )
        , ( "size_large", bulmaSizes.size4 )

        -- OTHERS
        -- Position of the Placeholder
        , ( "moveDownPlaceHolderLarge", "31" )
        , ( "moveDownPlaceHolderSmall", "30" )

        -- Transparent
        , ( "transparent", "#ffffff00" )
        , ( "muted", bulmaColor.grey_light )

        -- Button
        , ( "buttonFontSmall", "12" )
        , ( "buttonFontDefault", "16" )
        , ( "buttonFontMedium", "20" )
        , ( "buttonFontLarge", "24" )
        , ( "buttonFontJumbo", "16" )
        , ( "buttonPaddingXSmall", "9" )
        , ( "buttonPaddingYSmall", "3" )
        , ( "buttonPaddingXDefault", "12" )
        , ( "buttonPaddingYDefault", "5" )
        , ( "buttonPaddingXMedium", "15" )
        , ( "buttonPaddingYMedium", "7" )
        , ( "buttonPaddingXLarge", "18" )
        , ( "buttonPaddingYLarge", "9" )
        , ( "buttonPaddingXJumbo", "24" )
        , ( "buttonPaddingYJumbo", "24" )
        ]
