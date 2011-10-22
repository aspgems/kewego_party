# The Kewego Ruby Gem
Simple ruby wrapper for Kewego API

## <a name="installation">Installation</a>
    gem install kewego_party

## <a name="ci">Continuous Integration</a>
[![Build Status](https://secure.travis-ci.org/aspgems/kewego_party.png)](http://travis-ci.org/aspgems/kewego_party)

## <a name="examples">Examples</a>
### <a name="video-details">Video Details</a>

  ````ruby
  client = KewegoParty::Client.new(:token => your_api_token)
  client.video_get_details(video_identifier)
  => <#Hashie::Rash access="public" audience_classification="all_public" author="charhadas" available_formats=<#Hashie::Rash format=["ipadHQ", "iphone", "iphone3G",   "normal", "old", "slides"]> available_subtitles="available_subtitle" broadcast_end_date="2037-12-31 23:59:59" broadcast_start_date="2011-07-06 13:26:20" categories=<#Hashie::Rash category="Actualidades"> chapter_available="no" comments="0" country="es" default_display_subtitle="none" default_format="sd" description="<p>Entrevista Charhadas</p>" duration="221" keywords=<#Hashie::Rash keyword=["entrevista", "ceos", "socias"]> language="es" metadata=nil pid="" postal_code="28023" production_date="0000-00-00 00:00:00" publication_date="2011-07-06 13:26:20" rate="0" rating_count="0" ratio="1.7778" slide_available="no" thumbnails=<#Hashie::Rash large=<#Hashie::Rash url=["http://tll.kewego.com/t/0/0071/400x300_iLyROoaf22Mr_1.jpg", "http://tll.kewego.com/t/0/0071/400x300_iLyROoaf22Mr_2.jpg", "http://tll.kewego.com/t/0/0071/400x300_iLyROoaf22Mr_3.jpg"]> medium=<#Hashie::Rash url=["http://tll.kewego.com/t/0/0071/154x114_iLyROoaf22Mr_1.jpg", "http://tll.kewego.com/t/0/0071/154x114_iLyROoaf22Mr_2.jpg", "http://tll.kewego.com/t/0/0071/154x114_iLyROoaf22Mr_3.jpg"]> small=<#Hashie::Rash url=["http://tll.kewego.com/t/0/0071/74x54_iLyROoaf22Mr_1.jpg", "http://tll.kewego.com/t/0/0071/74x54_iLyROoaf22Mr_2.jpg", "http://tll.kewego.com/t/0/0071/74x54_iLyROoaf22Mr_3.jpg"]>> title="Entrevista CharHadas" videoblog_link=nil views="16">
  ````

## <a name="pulls">Submitting a Pull Request</a>
1. Fork the project.
2. Create a topic branch.
3. Implement your feature or bug fix.
4. Add specs for your feature or bug fix.
5. Run <tt>bundle exec rake spec</tt>. If your changes are not 100% covered, go back to step 6.
6. Commit and push your changes.
7. Submit a pull request. Please do not include changes to the version or gemspec. (If you want to create your own version for some reason, please do so in a separate commit.)

## <a name="rubies">Supported Rubies</a>
This library aims to support and is [tested
against](http://travis-ci.org/aspgems/kewego_party) the following Ruby
implementations:

* Ruby 1.8.7
* Ruby 1.9.2
* Ruby 1.9.3
* [Rubinius](http://rubini.us/)
* [Ruby Enterprise Edition](http://www.rubyenterpriseedition.com/)

If something doesn't work on one of these interpreters, it should be considered
a bug.

## <a name="inspiration">Inspiration</a>
KewegoParty was inspired by [Octokit](https://github.com/pengwynn/octokit).

## <a name="copyright">Copyright</a>
Copyright (c) 2011 [ASPgems](http://aspgems.com).
See [LICENSE](https://github.com/aspgems/kewego_party/blob/master/LICENSE) for details.
