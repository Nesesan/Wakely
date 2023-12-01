class GetSpotifyService
  def initialize
    RSpotify.authenticate(ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_CLIENT_SECRET"])
  end

  def get_tracks(keyword)
    tracks = RSpotify::Track.search(keyword)
    tracks.first(5)
  end
end
