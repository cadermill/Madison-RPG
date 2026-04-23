using UnityEngine;

public class DoomScrollAudioManager : MonoBehaviour
{
    public static DoomScrollAudioManager Instance { get; private set; }

    [Header("Clips")]
    public AudioClip backgroundMusic;
    public AudioClip correctClip;
    public AudioClip wrongClip;

    [Range(0f, 1f)] public float musicVolume = 0.4f;
    [Range(0f, 1f)] public float sfxVolume = 1f;

    private AudioSource musicSource;
    private AudioSource sfxSource;

    void Awake()
    {
        if (Instance != null && Instance != this) { Destroy(gameObject); return; }
        Instance = this;

        musicSource = gameObject.AddComponent<AudioSource>();
        musicSource.loop = true;
        musicSource.playOnAwake = false;
        musicSource.volume = musicVolume;

        sfxSource = gameObject.AddComponent<AudioSource>();
        sfxSource.loop = false;
        sfxSource.playOnAwake = false;
        sfxSource.volume = sfxVolume;
    }

    void Start()
    {
        if (backgroundMusic) { musicSource.clip = backgroundMusic; musicSource.Play(); }
    }

    public void PlayCorrect() { if (correctClip) sfxSource.PlayOneShot(correctClip, sfxVolume); }
    public void PlayWrong()   { if (wrongClip)   sfxSource.PlayOneShot(wrongClip,   sfxVolume); }
}