using UnityEngine;

public class BallRespawn : MonoBehaviour
{
    private Vector3 startPosition;
    private Rigidbody2D rb;
    
    [SerializeField] private float fallThreshold = -10f;
    [SerializeField] private AudioClip ballThumpSound;
    [SerializeField] private AudioClip sheepSound;
    [SerializeField] private float sheepChance = 0.1f; 
    [SerializeField] private float minTimeBetweenSounds = 0.1f; 
    
    private AudioSource audioSource;
    private float lastSoundTime;
    
    void Start()
    {
        startPosition = transform.position;
        rb = GetComponent<Rigidbody2D>();
        audioSource = gameObject.AddComponent<AudioSource>();
        audioSource.playOnAwake = false;
    }
    
    void Update()
    {
        if (transform.position.y < fallThreshold)
        {
            Respawn();
        }
    }
    
    void OnCollisionEnter2D(Collision2D collision)
    {
        if (Time.time - lastSoundTime < minTimeBetweenSounds)
            return;
        if (Random.value < sheepChance)
        {
            audioSource.PlayOneShot(sheepSound);
        }
        else
        {
            audioSource.PlayOneShot(ballThumpSound);
        }
        
        lastSoundTime = Time.time;
    }
    
    void Respawn()
    {
        transform.position = startPosition;
        rb.linearVelocity = Vector2.zero;
        rb.angularVelocity = 0f;
    }
}