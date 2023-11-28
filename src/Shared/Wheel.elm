module Shared.Wheel exposing (..)

type Event
    = UserCreatedWheel String String
    | UserChangedWheelName String String
    | UserAddedWheelItem String String String
    | UserRemovedWheelItem String String String

type Command
    = CreateNewWheel String String
    | ChangeWheelName String String String
    | AddWheelItem String String String
    | RemoveWheelItem String String String

type State = {
    itemIds:  List String,
    name: String
    id: String
}


reducer : State -> Event -> State
reducer state event =
    case event of
        UserCreatedWheel id name ->
            { state | id = id, name = name }

        UserChangedWheelName id name ->
            { state | name = name }

        UserAddedWheelItem id itemId ->
            { state | itemIds = itemId :: state.itemIds }

        UserRemovedWheelItem id itemId ->
            { state | itemIds = List.filter (\i -> i /= itemId) state.itemIds }
