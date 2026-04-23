using UnityEngine;

/// Attach to any clickable GameObject to make it float upward on mouse hover.
/// Works for both ingredient buttons and client characters.
public class HoverFloat : MonoBehaviour
{
    [Header("Float Settings")]
    [Tooltip("How many units to lift on hover")]
    public float floatAmount = 0.15f;

    [Tooltip("How fast it moves up/down")]
    public float floatSpeed = 8f;

    [Tooltip("If true, only floats when the order is correct (use on clients)")]
    public bool onlyWhenOrderCorrect = false;

    private Vector3 originalPosition;
    private Vector3 targetPosition;
    private bool isHovered = false;

    void Start()
    {
        originalPosition = transform.position;
        targetPosition = originalPosition;
    }

    void Update()
    {
        transform.position = Vector3.Lerp(transform.position, targetPosition, Time.deltaTime * floatSpeed);
    }

    void OnMouseEnter()
    {
        if (onlyWhenOrderCorrect && !OrderManager.Instance.IsOrderCorrect()) return;
        if (!GameManager.Instance.IsGameActive()) return;

        isHovered = true;
        targetPosition = originalPosition + new Vector3(0f, floatAmount, 0f);
        AudioManager.Instance?.PlayHover();
    }

    void OnMouseExit()
    {
        isHovered = false;
        targetPosition = originalPosition;
    }

    void OnMouseDown()
    {
        if (onlyWhenOrderCorrect && !OrderManager.Instance.IsOrderCorrect()) return;
        if (!GameManager.Instance.IsGameActive()) return;

        AudioManager.Instance?.PlayClick();
    }

    // If order state changes while hovering (e.g. last ingredient added),
    // re-evaluate whether to stay lifted
    void LateUpdate()
    {
        if (!isHovered) return;

        if (onlyWhenOrderCorrect && !OrderManager.Instance.IsOrderCorrect())
            targetPosition = originalPosition;
        else if (GameManager.Instance.IsGameActive())
            targetPosition = originalPosition + new Vector3(0f, floatAmount, 0f);
    }

    /// Call this if the object gets repositioned at runtime so the anchor updates
    public void RefreshOrigin()
    {
        originalPosition = transform.position;
        targetPosition = isHovered
            ? originalPosition + new Vector3(0f, floatAmount, 0f)
            : originalPosition;
    }
}