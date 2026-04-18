using UnityEngine;
using System.Collections.Generic;

public class ClientManager : MonoBehaviour
{
    public static ClientManager Instance { get; private set; }

    [Header("Client GameObjects (drag all clients here)")]
    public List<GameObject> clients = new List<GameObject>();

    public GameObject CurrentClient { get; private set; }
    public CoffeeOrder CurrentTargetOrder { get; private set; }

    private int lastClientIndex = -1;

    void Awake()
    {
        if (Instance != null && Instance != this) { Destroy(gameObject); return; }
        Instance = this;
    }

    void Start()
    {
        // Hide all clients at start; PickNewClient will reveal one
        foreach (var c in clients)
            if (c) c.SetActive(false);
    }

    public void PickNewClient()
    {
        if (clients.Count == 0) return;

        // Hide previous
        if (CurrentClient) CurrentClient.SetActive(false);

        // Pick a different client than last time (if possible)
        int index;
        if (clients.Count == 1)
        {
            index = 0;
        }
        else
        {
            do { index = Random.Range(0, clients.Count); }
            while (index == lastClientIndex);
        }
        lastClientIndex = index;

        CurrentClient = clients[index];
        CurrentClient.SetActive(true);

        // Reset greyed-out appearance
        SetClientGreyed(false);

        // Generate new random order
        CurrentTargetOrder = CoffeeOrder.GenerateRandom();

        // Update speech bubble
        SpeechBubble.Instance?.ShowOrder(CurrentTargetOrder);

        // Reset the ongoing order display
        OrderManager.Instance?.ResetOrder();
    }

    /// <summary>Grey out or restore the current client sprite.</summary>
    public void SetClientGreyed(bool greyed)
    {
        if (!CurrentClient) return;
        var renderers = CurrentClient.GetComponentsInChildren<SpriteRenderer>();
        foreach (var sr in renderers)
            sr.color = greyed ? new Color(0.4f, 0.4f, 0.4f, 1f) : Color.white;
    }
}