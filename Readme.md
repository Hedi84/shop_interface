This Koru Kids Technical Exercise was written in Ruby version '2.4.4'.

The interface consists of 4 models, and two files for coupons and items that can
be extended. The biggest challenge of this exercise was to make it possible to
extend the system in a way that follows the SOLID principles. Because these
principles would be violated by constantly changing a promotions class, I decided
to implement different classes for different types of promotions. In this manner,
the checkout class does not need to be changed for each promotion, just a new
possibility should be added in connection to the new class. Promotions falling
into the categories of the existing promotion classes can easily be added.
Multiple promotions can be used at the same time, the basket promotions that are
applied to the full basket price will not be applied until the very end of the
process.

To run the RSpec tests, make sure RSpec is installed and run the `rake` command
in the terminal.
