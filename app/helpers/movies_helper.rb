module MoviesHelper
    def total_gross(movie)
        if movie.flop?
            "Flop Movie!"
        else
            number_to_currency(movie.total_gross, precision: 0)
        end
    end

    def year_of(movie)
        movie.released_on.strftime("%Y")
    end

    def average_stars(movie)
        if movie.average_stars.zero?
          "No reviews"
        else
            "*" * movie.average_stars
        end
    end
    
end
