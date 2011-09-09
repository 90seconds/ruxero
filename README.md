# RuXero (Xero API Ruby Client) ![Project status](http://stillmaintained.com/waynerobinson/xeroizer.png)

* **Github**: [https://github.com/KieranP/RuXero](https://github.com/KieranP/RuXero)
* **Author**: Kieran Pilkington ([https://github.com/KieranP](https://github.com/KieranP))
* **Coypright:** 2011
* **License:** MIT License

## Goals for this project

* Provide a Rails 3 like syntax for querying records

    ``` ruby
    RuXero::Invoice.where(:invoice_id => 'something').all
    RuXero::Contact.where(:contact_id => 'something').all
    ```

* Provide a Rails 3 like syntax for creating records

    ``` ruby
    RuXero::Contact.new(:name => 'Joe Somebody')

    RuXero::Contact.create(:name => 'Joe Somebody')

    record = RuXero::Contact.new
    record.name = 'Joe Somebody'
    record.save
    ```

* Provide a Rails 3 like syntax for updating records

    ``` ruby
    record = RuXero::Contact.where(:contact_id => 'something').first
    record.update_attributes(:name => 'Joe Somebody')

    record = RuXero::Contact.where(:contact_id => 'something').first
    record.name = 'Joe Somebody'
    record.save
    ```

* Provide an easy configuration interface

    ``` ruby
    RuXero.configure do
      oauth_consumer_key 'ABCDEFGHIJKLMNOPQRSTUVWXYZABCD'
      oauth_consumer_secret 'ABCDEFGHIJKLMNOPQRSTUVWXYZABCD'
      private_key_path Rails.root.join('config/xero/privatekey.pem')
    end

    RuXero.configuration.oauth_consumer_key = 'ABCDEFGHIJKLMNOPQRSTUVWXYZABCD'
    ```

* Provide thorough code documentation using [SDoc](https://github.com/voloko/sdoc)

* Provide clear usage examples through a detailed test suite
