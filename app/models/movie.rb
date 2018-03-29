class Movie < ApplicationRecord

    include HTTParty
    base_uri 'http://www.omdbapi.com/'

    def self.example
        create!(
            title: "Cee Movie",
            genre: "Lame",
            year: 2008,
            synopsis: "It's the best",
            picture: "url"
        )


        end
    
    def self.search search_term
        movie = find_by search_term: search_term
        return movie unless movie.nil?
        api_key = "5be847be"
        response = get "?t=#{search_term}&apikey=#{api_key}"
    
    
        create!(title: response['Title'],
                genre:  response['Genre'],
                year: response['Year'],
                synopsis: response['Plot'],
                picture: response['Poster'])
    end
        
     
   


end
