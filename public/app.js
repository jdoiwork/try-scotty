var echo = new Vue({
  el: '#echo',
  data: {
    words: ''
  }
})

var shout = new Vue({
  el: '#shout',
  data: {
    words: ''
  }
})

var production = new Vue({
  el: '#production',
  data: {
    pro: 765,
    pros: [765, 346, 315, 283]
  },
  methods: {
    setPro: function(n) { this.pro = n },
    
  }
})

var idols = new Vue({
  el: '#idols',
  data: {
    query: '',
    items: [],
  },
  methods: {
    search: async function(n) {
      console.debug("search")
      var path = '/idols?q=' + this.query
      console.debug(path)
      var res = await axios.get(path)
      this.items = res.data.idols
    },
    
  }
})
