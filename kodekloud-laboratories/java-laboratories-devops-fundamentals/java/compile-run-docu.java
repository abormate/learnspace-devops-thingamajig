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


// compile build stage (outside source code) -- we can compile from the terminal space
javac MyClass.java

// compilation finishes outputting another file, executable as "MyClass.class"

// documentation generation
javadoc -d doc MyClass.java

// finally run executable with java JRE -- notice we didn't include the file extension for the run 
java MyClass
