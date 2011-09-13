# Ruxero (Xero API Ruby Client) ![Project status](http://stillmaintained.com/waynerobinson/xeroizer.png)

* **Github**: [https://github.com/KieranP/Ruxero](https://github.com/KieranP/Ruxero)
* **Author**: Kieran Pilkington ([https://github.com/KieranP](https://github.com/KieranP))
* **Coypright:** 2011
* **License:** MIT License

## Goals for this project

* Provide a Rails 3 like syntax for querying records

    ``` ruby
    Ruxero::Invoice.where(:invoice_id => 'something').all
    Ruxero::Contact.where(:contact_id => 'something').all
    ```

* Provide a Rails 3 like syntax for creating records

    ``` ruby
    Ruxero::Contact.new(:name => 'Joe Somebody')

    Ruxero::Contact.create(:name => 'Joe Somebody')

    record = Ruxero::Contact.new
    record.name = 'Joe Somebody'
    record.save
    ```

* Provide a Rails 3 like syntax for updating records

    ``` ruby
    record = Ruxero::Contact.where(:contact_id => 'something').first
    record.update_attributes(:name => 'Joe Somebody')

    record = Ruxero::Contact.where(:contact_id => 'something').first
    record.name = 'Joe Somebody'
    record.save
    ```

* Provide an easy configuration interface

    ``` ruby
    Ruxero.configure do |config|
      config.application = Ruxero::PrivateApplication
      config.oauth_consumer_key = 'ABCDEFGHIJKLMNOPQRSTUVWXYZABCD'
      config.oauth_consumer_secret = 'ABCDEFGHIJKLMNOPQRSTUVWXYZABCD'
      config.private_key_path = Rails.root.join('config/xero/privatekey.pem')
    end

    Ruxero.configuration.oauth_consumer_key = 'ABCDEFGHIJKLMNOPQRSTUVWXYZABCD'
    ```

* Provide thorough code documentation using [SDoc](https://github.com/voloko/sdoc)

* Provide clear usage examples through a detailed test suite
