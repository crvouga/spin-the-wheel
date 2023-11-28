module Wheel.Types exposing (..)

import Dict exposing (Dict)
import Shared.Wheel as Wheel
import Shared.WheelItem as WheelItem
import Shared.WheelSession as WheelSession


type alias CoreModel =
    { wheelSessionEvents: Dict String WheelSession.Event
    , wheelItemEvents: Dict String WheelItem.Event
    , wheelEvents: Dict String Wheel.Event
    --
    , indexWheelItemsByWheelId: Dict String String
    , indexWheelSessionByUserId: Dict String String
    }

initCoreModel : CoreModel
initCoreModel =
    { wheelSessionEvents = Dict.empty
    , wheelItemEvents = Dict.empty
    , wheelEvents = Dict.empty
    --
    , indexWheelItemsByWheelId = Dict.empty
    , indexWheelSessionByUserId = Dict.empty
    }

type alias FrontendModel =
    { core: CoreModel
    , wheelRequests: Dict Wheel.Command (RemoteResult String Wheel.Event)
    , wheelItemRequests: Dict WheelItem.Command (RemoteResult String WheelItem.Event)
    , wheelSessionRequests: Dict WheelSession.Command (RemoteResult String WheelSession.Event)
    }


type alias BackendModel =
    { core: CoreModel
    }


type FrontendMsg
    = UserClickedSpinWheelButton
    | UserClickedRemoveWheelItemButton String


type ToBackend
    = WheelCommand Wheel.Command
    | WheelItemCommand WheelItem.Command
    | WheelSessionCommand WheelSession.Command


type BackendMsg
    = NoOpBackendMsg


type ToFrontend
    = WheelSessionCommandResult (Result String WheelSession.Event)


