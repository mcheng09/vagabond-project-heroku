
# require './models/user.rb'
# require './models/post.rb'

User.destroy_all
Post.destroy_all
City.destroy_all

users = User.create! ([{first_name: "Anthony", last_name: "Schurz", email: "anthonyschurz@gmail.com", location: "San Francisco", password: "password1"},
{first_name: "Wayne", last_name: "Banks", email: "waynbanks13@gmail.com", location: "San Francisco", password: "password2"}])

posts = Post.create! ([{title: "Free Kittens", description: "There are free kittens on 16th and mission for anyone looking for a new pet.", user_id: 1, city_id: 1},
{title: "Lost Cat", description: "I can't find my large Tabby Cat, Mr Bigglesworth", user_id: 1, city_id: 1},
{title: "Cat Advice", description: "What should I be feeding my elderly cat?", user_id: 2, city_id: 1},
{title: "Favorite Cat", description: "Does anyone want to share their favorite type of cat? Thinking about adopting", user_id: 2, city_id: 1}])

cities = City.create! ([{name: "San Francisco", country: "USA", description: "San Francisco, in northern California, is a city on the tip of a peninsula surrounded by the Pacific Ocean and San Francisco Bay. It's known for its hilly landscape, year-round fog, iconic Golden Gate Bridge, cable cars and colorful Victorian houses. The Financial District's Transamerica Pyramid is its most distinctive skyscraper. In the bay sits Alcatraz Island, site of the notorious former prison."},
  {name: "London", country: "United Kingdom", description: "London, England’s capital, set on the River Thames, is a 21st-century city with history stretching back to Roman times. At its centre stand the imposing Houses of Parliament, the iconic ‘Big Ben’ clock tower and Westminster Abbey, site of British monarch coronations. Across the Thames, the London Eye observation wheel provides panoramic views of the South Bank cultural complex, and the entire city."},
  {name: "Gibraltar", country: "British Overseas Territory", description: "Gibraltar is a British Overseas Territory on the south coast of Spain known for the Rock of Gibraltar, a 426m limestone ridge at its centre. Gibraltar occupies 7 sq. km of a peninsula bordered to the north by the region of Andalusia. First settled by Moors in the Middle Ages and later ruled by Spain, the outpost was joined to Britain in 1713."}])
