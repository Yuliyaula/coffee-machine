package machine;
import java.util.Scanner;
public class CoffeeMachine {


    public static void main(String[] args) {
        int[] res = {400, 540, 120, 9, 550};
        int[] resN = {0, 0, 0, 1, 0};
        Scanner scanner = new Scanner(System.in);


        String action;

        while (true) {
            System.out.println("Write action (buy, fill, take, remaining, exit):");
            action = scanner.next();
            switch (action) {
                case "buy":
                    System.out.println("What do you want to buy? 1 - espresso, 2 - latte, 3 - cappuccino, back - to main menu:");
                    String num = scanner.next();

                    switch (num) {
                        case "1":
                            resN = new int[]{250, 0, 16, 1, -4};
                            buy(res, resN);
                            break;
                        case "2":
                            resN = new int[]{350, 75, 20, 1, -7};
                            buy(res, resN);
                            break;
                        case "3":
                            resN = new int[]{200, 100, 12, 1, -6};
                            buy(res, resN);
                            break;
                        default:
                            break;
                    }
                    break;
                case "fill":
                    System.out.println("Write how many ml of water you want to add:");
                    resN[0] = scanner.nextInt() * -1;
                    System.out.println("Write how many ml of milk you want to add:");
                    resN[1] = scanner.nextInt() * -1;
                    System.out.println("Write how many grams of coffee beans you want to add: ");
                    resN[2] = scanner.nextInt() * -1;
                    System.out.println("Write how many disposable cups of coffee you want to add:");
                    resN[3] = scanner.nextInt() * -1;
                    resN[4] = 0;
                    remaining(res, resN);

                    break;
                case "take":
                    System.out.println("I gave you $" + res[4]);
                    res[4] = 0;
                    break;
                case "remaining":
                    System.out.println("The coffee machine has:\n" +
                            res[0] + " ml of water\n" +
                            res[1] + " ml of milk\n" +
                            res[2] + " g of coffee beans\n" +
                            res[3] + " disposable cups\n" +
                            "$" + res[4] + " of money");
                    break;
                case "exit":
                    System.exit(0);

            }

        }
    }



    public static int[] remaining(int[] res, int[] resN) {
        for (int i = 0; i < res.length; i++) {
            res[i] -= resN[i];
        }
        return res;
    }

    public static void buy(int[] res, int[] resN) {
        if (res[0] >= resN[0] && res[1] >= resN[1] && res[2] >= resN[2] && res[3] >= resN[3]) {
            remaining(res, resN);
            System.out.println("I have enough resources, making you a coffee!");
        } else if (res[0] < resN[0]) {
            System.out.println("Sorry, not enough water!");
        } else if (res[1] < resN[1]) {
            System.out.println("Sorry, not enough coffee!");
        } else if (res[2] < resN[2]) {
            System.out.println("Sorry, not enough milk!");
        } else if (res[3] < resN[3]) {
            System.out.println("Sorry, not enough cups!");
        }
    }

}
