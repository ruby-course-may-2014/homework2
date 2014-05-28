[
  ["Star Wars", "PG", "1977-05-02 00:00:00 UTC"],
  ["Aladdin", "G", "1992-11-25 00:00:00 UTC"],
  ["The Terminator", "R", "1984-10-26 00:00:00 UTC"],
  ["When Harry Met Sally", "R", "1989-07-21 00:00:00 UTC"],
  ["The Help", "PG-13", "2011-08-10 00:00:00 UTC"],
  ["Chocolat", "PG-13", "2001-01-05 00:00:00 UTC"],
  ["Amelie", "R", "2001-04-25 00:00:00 UTC"],
  ["2001: A Space Odyssey", "G", "1968-04-06 00:00:00 UTC"],
  ["The Incredibles", "PG", "2004-11-05 00:00:00 UTC"],
  ["Raiders of the Lost Ark", "PG", "1981-06-12 00:00:00"],
  ["Chicken Run", "G", "2000-06-21 00:00:00"]
].each do |(title, rating, date)|
  Movie.create! title: title, rating: rating, release_date: DateTime.parse(date)
end
