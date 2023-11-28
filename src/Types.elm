module Types exposing (..)

import Browser exposing (UrlRequest)
import Browser.Navigation exposing (Key)
import Url exposing (Url)
import Dict exposing (Dict)
import Lamdera exposing (SessionId)
import Set exposing (Set)
import Enities.Wheel as Wheel
import Shared.WheelItem
import Shared.WheelSession

--  Wheels

type alias FrontendModel =
    { key : Key
    , message : String
    , wheel: Wheel
    , wheelSessionEvents: Dict String (List WheelSesssi)
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

