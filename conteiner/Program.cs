public struct PointStruct { public int X; public int Y;  }
class PointClass { public int X; public int Y;}
class Programm
{
    static void Main(string[] args)
    {
        PointStruct a1 = new PointStruct() { X = 1, Y = 2};
        PointClass a2 = new PointClass() { X = 3, Y = 4};
    }
}