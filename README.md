LazyHash
========
[![Build Status](https://secure.travis-ci.org/rogercampos/lazyhash.png)](http://travis-ci.org/rogercampos/lazyhash)

LazyHash is a simple library to work with lazy hash's, giving you the ability
to create key/value pairs with any deep programatically.

Let's give you some examples:

    hash = LazyHash.build_hash
    LazyHash.add(hash, "en.projects.title", "Main title")
    LazyHash.add(hash, "en.ph1", "one paragraph")

    hash #=> {"en" => { "projects" => { "title" => "Main title" }, "ph1" => "one paragraph" } }




Marshable hash
--------------

Since a lazy hash has a Proc constructor to dinamycaly create nested hash's,
it's not marshable. You can use the following method to construct a new hash
without a proc:

    lazy_hash = LazyHash.build_hash
    ...
    nolazy = LazyHash.no_lazy(lazy_hash)

Now 'nolazy' can be saved into database with marshal. The original hash
remains the same. Also note that you won't be able to use LazyHash.add with
this new hash 'nolazy'.
