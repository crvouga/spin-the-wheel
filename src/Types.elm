module Types exposing (..)

import Browser exposing (UrlRequest)
import Browser.Navigation exposing (Key)
import Url exposing (Url)
import Dict exposing (Dict)
import Lamdera exposing (SessionId)
import Set exposing (Set)

--  Wheels

type alias FrontendModel =
    { key : Key
    , message : String
    , wheelSessionEvents: Dict String (List WheelSessionEvent)
    , wheelItemEvents: Dict String (List WheelItemEvent)
    , wheelEvents: Dict String (List WheelEvent)
    }




type alias BackendModel =
    { message : String
    --
    , userSessions: Dict SessionId UserSession
    --
    , wheelSessions: Dict String WheelSession
    , wheelItems: Dict String WheelItem
    , wheels: Dict String Wheel
    }

type WheelEvent
    = UserCreatedWheel String String
    | UserChangedWheelName String String
    | UserAddedWheelItem String String String
    | UserRemovedWheelItem String String String

type WheelCommand
    = CreateNewWheel String String
    | ChangeWheelName String String String
    | AddWheelItem String String String
    | RemoveWheelItem String String String

type WheelItemEvent =
    | UserCreatedWheelItem String String String
    | UserChangedWheelItemLabel String String String

type WheelState = {
    itemIds: List String,
    name: String
    id: String
}

type WheelItemState = {
    id: String
    label: String
}





type WheelSessionEvent
    = UserStarted String
    | UserJoined String
    | UserLeft String
    | UserChangedWheel String String
    | UserSpunWheel String String

type WheelSessionCommand
    = Start String
    | Join String String
    | Leave String String
    | ChangeWheel String String String
    | SpinWheel String String String

type WheelSessionState = {
    isWheelSpinning: Bool
    wheelId: String
    userIds: Set String
}


reducer : WheelSessionState -> WheelSessionEvent -> WheelSessionState
reducer state event =
    case event of
        UserStarted userId ->
            { state | userIds = Set.insert userId state.userIds }

        UserJoined userId ->
            { state | userIds = Set.insert userId state.userIds }

        UserLeft userId ->
            { state | userIds = Set.remove userId state.userIds }

        UserChangedWheel userId wheelId ->
            state

        UserSpunWheel userId wheelId ->
            state

type FrontendMsg
    = UrlClicked UrlRequest
    | UrlChanged Url
    | NoOpFrontendMsg


type ToBackend
    = NoOpToBackend


type BackendMsg
    = NoOpBackendMsg


type ToFrontend
    = NoOpToFrontend
    | UserJoinedWheelSession
    | UserLeftWheelSession

