module Tmdb
  # Movie resource
  class Movie < Tmdb::ApiResource
    # Get the basic movie information for a specific movie id.
    def self.find(id, opts = { append: [] })
      build_single_resource(
        Tmdb::Requester.get("movie/#{id}", append_to_response: opts[:append]),
        MovieRepresenter
      )
    end

    # Get the latest movie id.
    def self.latest
      build_single_resource(
        Tmdb::Requester.get('movie/latest'),
        MovieRepresenter
      )
    end

    # Get the list of movies playing that have been released this week.
    def self.now_playing(page = 1)
      build_collection(
        Tmdb::Requester.get('movie/now_playing', page: page)['results'],
        MovieRepresenter
      )
    end

    # Get the list of popular movies.
    def self.popular(page = 1)
      build_collection(
        Tmdb::Requester.get('movie/popular', page: page)['results'],
        MovieRepresenter
      )
    end

    # Get the list of top rated movies.
    def self.top_rated(page = 1)
      build_collection(
        Tmdb::Requester.get('movie/top_rated', page: page)['results'],
        MovieRepresenter
      )
    end

    # Get the list of upcoming movies by release date.
    def self.upcoming(page = 1)
      build_collection(
        Tmdb::Requester.get('movie/upcoming', page: page)['results'],
        MovieRepresenter
      )
    end
  end
end