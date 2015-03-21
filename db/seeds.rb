# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')

def db_connection
  begin
    connection = PG.connect(dbname: "cards_against_humanity")
    yield(connection)
  ensure
    connection.close
  end
end

# def get_cards
#   if @color == "white"
#     sql = "SELECT text FROM white_cards"
#   else
#     sql = "SELECT text FROM black_cards WHERE pick = 1"
#   end
#   @all_cards = []
#   cards = (db_connection { |conn| conn.exec_params(sql) }).to_a
#   cards.each do |card|
#     @all_cards << Card.new(card["text"])
#   end
#   @all_cards
# end

def seed_white_cards
  sql = "SELECT text FROM white_cards"
  cards = (db_connection { |conn| conn.exec_params(sql) }).to_a
  cards.each do |card|
    Card.find_or_create_by!(color: "white", content: card["text"])
  end
end

def seed_black_cards
  sql = "SELECT text FROM black_cards WHERE pick = 1"
  cards = (db_connection { |conn| conn.exec_params(sql) }).to_a
  cards.each do |card|
    Card.find_or_create_by!(color: "black", content: card["text"])
  end
end

seed_white_cards
seed_black_cards
