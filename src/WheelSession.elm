module WheelSession exposing (..)

type Event
    = UserStarted String
    | UserJoined String
    | UserLeft String
    | UserChangedWheel String String
    | UserSpunWheel String String

type Command
    = Start String
    | Join String String
    | Leave String String
    | ChangeWheel String String String
    | SpinWheel String String String

type State = {
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

