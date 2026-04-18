using UnityEngine;

[System.Serializable]
public class CoffeeOrder
{
    public int vanilla;
    public int hazelnut;
    public int caramel;
    public int espresso;
    public int milk;
    public bool isIced;

    public static CoffeeOrder GenerateRandom()
    {
        return new CoffeeOrder
        {
            vanilla  = Random.Range(0, 6),
            hazelnut = Random.Range(0, 6),
            caramel  = Random.Range(0, 6),
            espresso = Random.Range(0, 6),
            milk     = Random.Range(0, 6),
            isIced   = Random.value > 0.5f
        };
    }

    public bool Matches(CoffeeOrder other)
    {
        return vanilla  == other.vanilla  &&
               hazelnut == other.hazelnut &&
               caramel  == other.caramel  &&
               espresso == other.espresso &&
               milk     == other.milk     &&
               isIced   == other.isIced;
    }

    public override string ToString()
    {
        var parts = new System.Collections.Generic.List<string>();
        if (vanilla  > 0) parts.Add($"Vanilla x{vanilla}");
        if (hazelnut > 0) parts.Add($"Hazelnut x{hazelnut}");
        if (caramel  > 0) parts.Add($"Caramel x{caramel}");
        if (espresso > 0) parts.Add($"Espresso x{espresso}");
        if (milk     > 0) parts.Add($"Milk x{milk}");
        parts.Add(isIced ? "ICED" : "HOT");
        return string.Join("\n", parts);
    }
}