using UnityEngine;

public class AudioManager : MonoBehaviour
{
    public static AudioManager Instance { get; private set; }

    [Header("Audio Sources")]
    public AudioSource musicSource;
    public AudioSource sfxSource;

    [Header("Clips")]
    public AudioClip backgroundMusic;
    public AudioClip orderCompleteClip;
    public AudioClip hoverClip;

    public AudioClip clickClip;

    void Awake()
    {
        if (Instance != null && Instance != this) { Destroy(gameObject); return; }
        Instance = this;
        DontDestroyOnLoad(gameObject);
    }

    void Start()
    {
        if (backgroundMusic)
        {
            musicSource.clip = backgroundMusic;
            musicSource.loop = true;
            musicSource.Play();
        }
    }

    public void PlayOrderComplete()
    {
        if (orderCompleteClip)
            sfxSource.PlayOneShot(orderCompleteClip);
    }

    public void PlayHover()
    {
        if (hoverClip)
            sfxSource.PlayOneShot(hoverClip);
    }

    public void PlayClick()
    {
        if (clickClip)
            sfxSource.PlayOneShot(clickClip);
    }
}