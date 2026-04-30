using UnityEngine;

public class MovingPlatform : MonoBehaviour
{
    [SerializeField] private float moveDistance = 5f;
    [SerializeField] private float moveSpeed = 12f;
    [SerializeField] private bool showPath = true;
    [SerializeField] private Color pathColor = Color.black;
    [SerializeField] private int dotCount = 8;
    [SerializeField] private float dotSize = 0.08f;
    [SerializeField] private AudioClip platformMoveSound;
    private AudioSource audioSource;
    
    private Vector3 startPos;
    private Vector3 targetPos;
    private bool movingUp = false;
    private Rigidbody2D rb;
    private Vector3 moveDirection;
    private GameObject pathContainer;
    
    void Start()
    {
        rb = GetComponent<Rigidbody2D>();
        if (rb == null)
        {
            rb = gameObject.AddComponent<Rigidbody2D>();
        }
        
        rb.bodyType = RigidbodyType2D.Kinematic;
        rb.collisionDetectionMode = CollisionDetectionMode2D.Continuous;
        moveDirection = transform.up;
        
        startPos = transform.position;
        targetPos = startPos + moveDirection * moveDistance;
        audioSource = gameObject.AddComponent<AudioSource>();
        audioSource.playOnAwake = false;
        
        if (showPath)
        {
            CreateDottedPath();
        }
    }
    
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            movingUp = !movingUp;
            if (platformMoveSound != null)
            {
                audioSource.PlayOneShot(platformMoveSound);
            }
        }
    }
    
    void FixedUpdate()
    {
        Vector3 destination = movingUp ? targetPos : startPos;
        Vector3 newPosition = Vector3.MoveTowards(rb.position, destination, moveSpeed * Time.fixedDeltaTime);
        rb.MovePosition(newPosition);
    }
    
    void CreateDottedPath()
    {
        pathContainer = new GameObject("PathDots_" + gameObject.name);
        float spacing = moveDistance / (dotCount - 1);
        
        for (int i = 0; i < dotCount; i++)
        {
            GameObject dot = new GameObject("Dot_" + i);
            dot.transform.SetParent(pathContainer.transform);
            SpriteRenderer spriteRenderer = dot.AddComponent<SpriteRenderer>();
            
            spriteRenderer.sprite = CreateCircleSprite();
            spriteRenderer.color = pathColor;
            spriteRenderer.sortingOrder = 10; 
            
            Vector3 dotPosition = startPos + moveDirection * (spacing * i);
            dot.transform.position = dotPosition;
            dot.transform.localScale = new Vector3(dotSize, dotSize, 1f);
        }
    }
    
    Sprite CreateCircleSprite()
    {
        int size = 32;
        Texture2D texture = new Texture2D(size, size);
        Color[] pixels = new Color[size * size];
        
        Vector2 center = new Vector2(size / 2f, size / 2f);
        float radius = size / 2f;
        
        for (int y = 0; y < size; y++)
        {
            for (int x = 0; x < size; x++)
            {
                float distance = Vector2.Distance(new Vector2(x, y), center);
                pixels[y * size + x] = distance <= radius ? Color.white : Color.clear;
            }
        }
        
        texture.SetPixels(pixels);
        texture.Apply();
        
        return Sprite.Create(texture, new Rect(0, 0, size, size), new Vector2(0.5f, 0.5f), size);
    }
    
    void OnDrawGizmos()
    {
        if (!Application.isPlaying && showPath)
        {
            Vector3 start = transform.position;
            Vector3 direction = transform.up;
            
            Gizmos.color = pathColor;
            
            float spacing = moveDistance / (dotCount - 1);
            for (int i = 0; i < dotCount; i++)
            {
                Vector3 dotPos = start + direction * (spacing * i);
                Gizmos.DrawSphere(dotPos, 0.05f);
            }
        }
    }
}