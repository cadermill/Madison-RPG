using UnityEngine;

/// Attach to each client GameObject.
/// When the player clicks the client AND the order is correct, it scores a point.
public class ClientClickHandler : MonoBehaviour
{
    void OnMouseDown()
    {
        if (!GameManager.Instance.IsGameActive()) return;

        // Only accept if order matches
        if (!OrderManager.Instance.IsOrderCorrect())
        {
            Debug.Log("Order doesn't match yet!");
            return;
        }

        // Score the point
        GameManager.Instance.AddScore();

        // Play order complete sound
        AudioManager.Instance?.PlayOrderComplete();

        // Pick a new client and generate a new order
        ClientManager.Instance.PickNewClient();
    }
}