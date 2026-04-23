using UnityEngine;

/// Attach to each article sprite GameObject.
public class NewsArticle : MonoBehaviour
{
    public bool isGoodNews;

    [HideInInspector]
    public Vector3 originalPosition;

    void Awake()
    {
        originalPosition = transform.position;
    }
}