require 'rest-client'
# Communicate with https://dreamscopeapp.com frontend
#   by uploading an image then downloading the result
class DreamScopeApi
  BASE_URL = 'https://dreamscopeapp.com/api/images'.freeze

  def self.get_dream_image(original_image)
    new()
      .upload(original_image)
      .result
  end

  def upload(image)
    response = JSON.parse RestClient.post(BASE_URL, post_data(image))
    RemoteImage.new(response['uuid'])
  end

  private

  def post_data(image)
    {
      filter: STYLES.sample,
      image: image
    }
  end

  STYLES = %i(
    angel_hair
    art_deco
    autumn
    blue
    bonfire
    botanical_dimensions
    bw_pastel
    cafe_terrace
    calligraphy
    cemetary
    charcoal_sketch
    charcoal
    clashing_by_clayton_kashuba
    codex_davinci
    cold_glow
    color_pastel
    crayon
    cubism
    durer_melencolia
    energy_buzz
    english_breakfast
    engraved_clay
    facelift
    fanime
    fire
    glitch_life
    graffiti_2
    graffiti
    graveyard_mist
    greek_pottery
    halloween_clinton
    halloween_frankenstein
    halloween_pirate
    halloween_skull
    halloween_spider
    halloween_trump
    halloween_web
    haunted_charcoal
    impasto
    inceptionist_painting
    Inkblot
    iridescent
    jeweled_bird
    jfk_portrait
    kandinsky
    library_of_alexandria
    light_painting
    matisse_boat
    matisse_cliffs
    matisse_farms
    median
    midnight_smoke
    mirage
    money
    motherboard_2
    motherboard
    nighthawk
    northern_renaissance
    oil_on_canvas
    oscilloscope
    petrified_wood
    picasso
    pumpkin
    salvia
    sandstorm
    self_transforming_machine_elves
    sketchasketch
    snow_crash
    springtime
    stained_glass_2
    stained_glass
    starry_night_landscape
    starry_night_portrait
    street_zebra
    supertrippy
    the_scream
    the_wave
    trippy
    tropical_sunrise
    two_girls
    van_gogh_portrait
    watercolor_casset_portrait
    watercolor_manet_portrait
    woman_weeping
  ).freeze
end
