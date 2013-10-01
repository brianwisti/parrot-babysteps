# Parrot Babysteps Sample Code

[Parrot Babysteps tutorial]: http://randomgeekery.org/pages/geekery/parrot/learn/
[Astronomy Nexus]: http://astronexus.com
[Parrot]: http://parrot.org

This is the sample code for my [Parrot Babysteps tutorial][]. I'm putting
it into a repository so that it will be easier for you to follow along,
and harder for me to lose these files.

Mostly so I don't lose these files.

## What's in here?

* A lot of simple [Parrot][] PIR code.
* `hygxyz.csv`: A catalog of stellar data from the [Astronomy Nexus][].
* Some tests to make sure the examples stay sane.

## What can I do with this?

Pretty much anything you want. The code is public domain. Feel free to
extract whatever value you can from it. If you want to do something
special with the star catalog, you may want to double-check with the
Astronomy Nexus site maintainer. He's pretty casual about usage, though.

With Perl installed, you can `prove` the examples work yourself:

    $ prove -Ilib

or

    $ make test

[Modern::Perl]: https://metacpan.org/module/Modern::Perl
[IPC::Run]: https://metacpan.org/module/IPC::Run

Note that I use [Modern::Perl][] and [IPC::Run][] in my code, so that's a dependency for the tests.

    $ sudo cpan Modern::Perl
    $ sudo cpan IPC::Run

## I have questions!

[My page]: http://randomgeekery.org/pages/brian/

Don't we all? You can find details about contacting me at [my page][].

Brian Wisti

<http://randomgeekery.org>
