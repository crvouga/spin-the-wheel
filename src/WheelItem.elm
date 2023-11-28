module WheelItem exposing (..)

type Event =
    | UserCreatedWheelItem String String String
    | UserChangedWheelItemLabel String String String

type Command =
    | CreateWheelItem String String String
    | ChangeWheelItemName String String String

type WheelItemState = {
    id: String
    label: String
}

reducer : WheelItemState -> Event -> WheelItemState
reducer state event =
    case event of
        UserCreatedWheelItem id label _ ->
            { state | id = id, label = label }

        UserChangedWheelItemLabel id label _ ->
            { state | label = label }


