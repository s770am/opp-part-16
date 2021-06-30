class BankAccount

@@interest_rate = 0.08
@@accounts = []

def initialize(name)
@name = name
@account_balance = 0
end

attr_accessor :account_balance

def deposit(amount)
@account_balance += amount
end

def withdraw(amount)
    @account_balance -= amount
end

def self.create(name)
@@accounts<< my_account = BankAccount.new(name)
return my_account
end

def self.total_funds
    value = 0
 @@accounts.each do |account|
value += account.account_balance
 end
 return value
end

def self.interest_time
 @@accounts.each do |account|
account.account_balance += account.account_balance * @@interest_rate
 end
end

end

dov_account = BankAccount.create("dov")
bob_account = BankAccount.create("bob")

dov_account.deposit(50)
bob_account.deposit(50)

bob_account.withdraw(25)

puts BankAccount.total_funds

BankAccount.interest_time

puts BankAccount.total_funds