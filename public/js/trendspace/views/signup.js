window.SignupView = Backbone.View.extend({
	initialize: function() {
		this.model = new User();
		this.render();
	},

	render: function() {
		$(this.el).html(this.template());
		return this;
	},

	events: {
		"keyup #email"				: "setEmail",
		"keyup #password"			: "setPassword",
		"keyup #ConfirmPassword"	: "setConfirmPassword",
		"click #submit"				: "signup"
	},

	signup: function (event) {
		event.preventDefault();
		this.model.save();
		console.log("we did it!");
	},

	setEmail: function(event) {
		var val = $(event.currentTarget).val();
		this.model.set({ email: val});
	},

	setPassword: function(event) {
		var val = $(event.currentTarget).val();
		this.model.set({ password: val});
	},

	setConfirmPassword: function(event) {
		var val = $(event.currentTarget).val();
		this.model.set({ confirmPassword: val});
	}
});