using UnityEngine;
using TMPro;
using UnityEngine;

public class OrderManager : MonoBehaviour
{
    public static OrderManager Instance { get; private set; }

    [Header("Ongoing Order UI Labels (TextMeshPro)")]
    public TextMeshProUGUI vanillaCountText;
    public TextMeshProUGUI hazelnutCountText;
    public TextMeshProUGUI caramelCountText;
    public TextMeshProUGUI espressoCountText;
    public TextMeshProUGUI milkCountText;
    public TextMeshProUGUI tempText;  // Shows "HOT" or "ICED"

    [Header("Cup GameObjects")]
    public GameObject hotCup;
    public GameObject icedCup;

    public CoffeeOrder CurrentOrder { get; private set; } = new CoffeeOrder();

    void Awake()
    {
        if (Instance != null && Instance != this) { Destroy(gameObject); return; }
        Instance = this;
    }

    void Start() => ResetOrder();

    // ── Ingredient adders ──────────────────────────────────────────────────

    public void AddVanilla()   { CurrentOrder.vanilla++;  RefreshUI(); }
    public void AddHazelnut()  { CurrentOrder.hazelnut++; RefreshUI(); }
    public void AddCaramel()   { CurrentOrder.caramel++;  RefreshUI(); }
    public void AddEspresso()  { CurrentOrder.espresso++; RefreshUI(); }
    public void AddMilk()      { CurrentOrder.milk++;     RefreshUI(); }

    public void ToggleIce()
    {
        CurrentOrder.isIced = !CurrentOrder.isIced;
        RefreshUI();
    }

    // ── Send-it: clears the order ──────────────────────────────────────────
    public void ResetOrder()
    {
        CurrentOrder = new CoffeeOrder { isIced = false };
        RefreshUI();
    }

    // ── Check if current order matches target ──────────────────────────────
    public bool IsOrderCorrect()
    {
        var target = ClientManager.Instance?.CurrentTargetOrder;
        return target != null && CurrentOrder.Matches(target);
    }

    // ── UI refresh ─────────────────────────────────────────────────────────
    private void RefreshUI()
    {
        if (vanillaCountText)  vanillaCountText.text  = $"{CurrentOrder.vanilla} Vanilla Pumps";
        if (hazelnutCountText) hazelnutCountText.text = $"{CurrentOrder.hazelnut} Hazelnut Pumps";
        if (caramelCountText)  caramelCountText.text  = $"{CurrentOrder.caramel} Caramel Pumps";
        if (espressoCountText) espressoCountText.text = $"{CurrentOrder.espresso} Espresso Shots";
        if (milkCountText)     milkCountText.text     = $"{CurrentOrder.milk} Milk ";
        if (tempText)          tempText.text          = CurrentOrder.isIced ? "ICED" : "HOT";

        // Swap cup visuals
        if (hotCup)  hotCup.SetActive(!CurrentOrder.isIced);
        if (icedCup) icedCup.SetActive(CurrentOrder.isIced);

        // Update client greyed state live
        bool correct = IsOrderCorrect();
        ClientManager.Instance?.SetClientGreyed(!correct);
    }
}