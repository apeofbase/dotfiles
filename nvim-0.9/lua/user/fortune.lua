local fortune = require("fortune")

fortune.setup {
  max_width = 60,
  display_format = 'mixed', -- Options: short, long, mixed
  content_type = 'quotes',  -- Options: quotes, tips, mixed
  custom_quotes = {
    short = {
      { "I live to grok" },
      { "I use Arch BTW" },
    },
    long = {
      { "I must not fear. Fear is the mind-killer. Fear is the little-death that brings total obliteration." },
      { "I will face my fear. I will permit it to pass over me and through me." },
      { "... when it has gone past I will turn the inner eye to see its path. Where the fear has gone there will be nothing. Only I will remain." },
      { "It is so shocking to find out how many people do not believe that they can learn, and how many more believe learning to be difficult." },
      { "Without change something sleeps inside us, and seldom awakens. The sleeper must awaken.", "- Frank Herbert" },
      { "Fear is the mind-killer. Fear is the little-death that brings total destruction." },
    },
  },
  custom_tips = {},
}
