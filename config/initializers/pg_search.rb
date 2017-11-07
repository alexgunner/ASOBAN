PgSearch.multisearch_options = {
  :using => {
    :tsearch => {:dictionary => "spanish", prefix: true},
    :trigram => {}
  },
  :ignoring => :accents
}
