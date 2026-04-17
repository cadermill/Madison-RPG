using UnityEngine;
using System.Collections.Generic;

[System.Serializable]
public class TriviaQuestion
{
    public string questionText;
    public string[] answers = new string[4];  // 4 choices
    public int correctAnswerIndex;             // 0–3
}

[CreateAssetMenu(fileName = "QuestionData", menuName = "Trivia/Question Data")]
public class QuestionData : ScriptableObject
{
    public List<TriviaQuestion> questions = new List<TriviaQuestion>();
}