Feature: TaniHub Test
	Scenario: Login
		Given Open TaniHub "https://tanihub.com/"
		Then Choose Location
		Then Click Masuk
		Then Login with Email "testinguser@mailinator.com"
        And Password "admin123"
        Then Login

	Scenario: Search Product
		Given Product "Minyak Goreng Rose Brand 2 L Karton"
		Then Select First Product to Add To Cart
		Then Checkout
		Then Select Address
		Then Select VA Payment Method "Mandiri"
		Then Proceed to Payment
		And Wait Until VA number appear


