using UnityEngine;

/// Attach this script to each interactable object.
/// Set the `action` field in the Inspector to tell it what to do when clicked.
public class IngredientButton : MonoBehaviour
{
    public enum ActionType
    {
        AddVanilla,
        AddHazelnut,
        AddCaramel,
        AddEspresso,   // Machine
        AddMilk,
        ToggleIce,
        SendIt         // Clears / resets the order
    }

    [Tooltip("What happens when this object is clicked")]
    public ActionType action;

    void OnMouseDown()
    {
        if (!GameManager.Instance.IsGameActive()) return;

        switch (action)
        {
            case ActionType.AddVanilla:   OrderManager.Instance.AddVanilla();  break;
            case ActionType.AddHazelnut:  OrderManager.Instance.AddHazelnut(); break;
            case ActionType.AddCaramel:   OrderManager.Instance.AddCaramel();  break;
            case ActionType.AddEspresso:  OrderManager.Instance.AddEspresso(); break;
            case ActionType.AddMilk:      OrderManager.Instance.AddMilk();     break;
            case ActionType.ToggleIce:    OrderManager.Instance.ToggleIce();   break;
            case ActionType.SendIt:       OrderManager.Instance.ResetOrder();  break;
        }
    }
}