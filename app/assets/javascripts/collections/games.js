RabbleReviews.Collections.Games = Backbone.Collection.extend({
    model: RabbleReviews.Models.Game, 

    url: 'api/games'
});