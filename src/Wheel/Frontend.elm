module Wheel.Frontend exposing (..)
import Wheel.Types exposing (initCoreModel, FrontendMsg, FrontendModel)
import Wheel.Types exposing (FrontendMsg(..))
import Dict
import Wheel.Types exposing (ToBackend)
import Wheel.Types exposing (ToBackend(..))
import Wheel.Types exposing (ToFrontend)

type alias Model =
    FrontendModel

type alias Msg =
    FrontendMsg

init: (Model, Cmd Msg)
init: (
    {
        core = initCoreModel
    },
    Cmd.none
)


update: (ToBackend -> Cmd msg) -> Msg -> Model -> (Model, Cmd Msg)
update sendToBackend msg model =
    case msg of
        UserClickedSpinWheelButton ->
            ({model| wheelSessionRequests = Dict.insert "hello" RemoteResult.Loading}, sendToBackend (WheelSessionCommand  WheelSessionCommand.SpinWheel) )

        UserClickedRemoveWheelItemButton ->
            (model, Cmd.none)


updateFromBackend: ToFrontend -> Model -> (Model, Cmd Msg)
updateFromBackend msg model =
    case msg of
        WheelSessionResult result ->
            ({model| wheelSessionRequests = Dict.remove "hello" model.wheelSessionRequests}, Cmd.none)

        WheelSessionError error ->
            ({model| wheelSessionRequests = Dict.remove "hello" model.wheelSessionRequests}, Cmd.none)

        _ ->
            (model, Cmd.none)



view : Model -> Html Msg
view model =
    div []
        [ button [ onClick UserClickedSpinWheelButton ] [ text "Spin Wheel" ]
        , button [ onClick UserClickedRemoveWheelItemButton ] [ text "Remove Wheel Item" ]
        ]

