// for a java written file  "MyClass.java" inside a directory -- with the following source
/**
 * Prints Hello World Message
 *
 */
public class MyClass {
    public static void main(String[] args) {
         System.out.println("Hello Kodekloud");
    }
}


// compile build stage
javac MyClass.java

// documentation generation
javadoc -d doc MyClass.java
