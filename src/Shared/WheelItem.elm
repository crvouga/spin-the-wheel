module Shared.WheelItem exposing (..)

type Event =
    | UserCreatedWheelItem {userId: String itemId: String label: String}
    | UserChangedWheelItemLabel {userId: String itemId: String label:String}

type Command =
    | CreateWheelItem String String String
    | ChangeWheelItemName String String String

type State = {
    id: String
    label: String
    createdBy: String
    lastModifiedBy: Maybe String
}

initialState: State
initialState =
    { id = "", label = "", createdBy = "", lastModifiedBy = Nothing }

reducer : State -> Event -> State
reducer state event =
    case event of
        UserCreatedWheelItem item ->
            { state | id = item.id, label = item.label, createdBy = item.userId }

        UserChangedWheelItemLabel item ->
            { state | label = item.label. createdBy = item.userId  }


