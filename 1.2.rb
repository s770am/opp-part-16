class Book
    @@on_shelf = []
    @@on_loan = []

    def initialize(title, author, isbn)
@title = title
@author = author
@isbn = isbn
@due_date = nil
    end

attr_reader :title, :due_date

    def self.create(title, author, isbn)
@@on_shelf << book = Book.new(title, author, isbn)
return book
    end

    def self.available
return @@on_shelf
    end

    def self.borrowed
return @@on_loan
    end

    def self.browse
return @@on_shelf.sample
    end

    def lent_out?
return @@on_loan.include?(self)
    end

 
    def current_due_date
           # 2 weeks
            Time.now + (60 * 60 * 24 * 14)
    end

    def borrow
if lent_out?
    puts "sorry this has already been lent out"
    return false
else 
    @@on_shelf.delete(self)
    @@on_loan << self
    @due_date = current_due_date
    puts "you have taken #{self.title} out of the library"
    return true
end
    end

    def return_to_library
if lent_out?
    @@on_loan.delete(self)
    @@on_shelf << self
    @due_date = nil
    puts "you have returned #{self.title}"
    return true
else
        return false
end
    end

    def self.overdue
        books = []
@@on_loan.each do |book|
    if Time.now > book.due_date
        books << book
    end
end
    end



end

sister_outsider = Book.create("Sister Outsider", "Audre Lorde", "9781515905431")
aint_i = Book.create("Ain't I a Woman?", "Bell Hooks", "9780896081307")
if_they_come = Book.create("If They Come in the Morning", "Angela Y. Davis", "0893880221")
puts Book.browse.inspect # #<Book:0x00555e82acdab0 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221"> (this value may be different for you)
puts Book.browse.inspect # #<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307"> (this value may be different for you)
puts Book.browse.inspect # #<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307"> (this value may be different for you)
puts Book.available.inspect # [#<Book:0x00555e82acde20 @title="Sister Outsider", @author="Audre Lorde", @isbn="9781515905431">, #<Book:0x00555e82acdce0 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307">, #<Book:0x00555e82acdab0 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221">]
puts Book.borrowed.inspect # []
puts sister_outsider.lent_out? # false
puts sister_outsider.borrow # true
puts sister_outsider.lent_out? # true
puts sister_outsider.borrow # false
puts sister_outsider.due_date # 2017-02-25 20:52:20 -0500 (this value will be different for you)
puts Book.available.inspect # [#<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307">, #<Book:0x00562314675fd8 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221">]
puts Book.borrowed.inspect # [#<Book:0x00562314676208 @title="Sister Outsider", @author="Audre Lorde", @isbn="9781515905431", @due_date=2017-02-25 20:55:17 -0500>]
puts Book.overdue.inspect # []
puts sister_outsider.return_to_library # true
puts sister_outsider.lent_out? # false
puts Book.available.inspect # [#<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307">, #<Book:0x00562314675fd8 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221">, #<Book:0x00562314676208 @title="Sister Outsider", @author="Audre Lorde", @isbn="9781515905431", @due_date=nil>]
puts Book.borrowed.inspect # []