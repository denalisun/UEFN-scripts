
using { /Fortnite.com/Devices }
using { /Fortnite.com/UI }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/UI }
using { /UnrealEngine.com/Temporary/SpatialMath }

# A Verse-authored creative device that can be placed in a level
FirstPersonDevice := class(creative_device):

    @editable
    FirstPersonPropManipulator: prop_manipulator_device = prop_manipulator_device{}

    @editable
    FirstPersonMutatorZone: mutator_zone_device = mutator_zone_device{}

    @editable
    var IsFirstPersonEnabled: logic = false

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        # TODO: Replace this with your code
        FirstPersonMutatorZone.AgentBeginsEmotingEvent.Subscribe(ToggleFirstPerson)
        if (IsFirstPersonEnabled = true):
            EnableFirstPerson()
        else:
            DisableFirstPerson()

    ToggleFirstPerson(Agent: agent):void=
        if (Player := player[Agent]):
            if (IsFirstPersonEnabled = true):
                DisableFirstPerson()
            else:
                EnableFirstPerson()
                

    EnableFirstPerson():void=
        FirstPersonPropManipulator.ShowProps()
        set IsFirstPersonEnabled = true

    DisableFirstPerson():void=
        FirstPersonPropManipulator.HideProps()
        set IsFirstPersonEnabled = false