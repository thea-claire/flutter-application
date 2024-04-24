import 'package:flutter/cupertino.dart';
import 'package:flutter_app/blog/data/models/summary_entry.dart';
import 'package:flutter_app/blog/data/models/summary_form.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class BlogProvider extends ChangeNotifier {
  final List<SummaryEntry> _summaries = [
    SummaryEntry(
        id: _uuid.v1(),
        title: 'Rich Dad, Poor Dad',
        subtitle: 'Robert Kiyosaki',
        date: 'January 1, 2023',
        body:
            "To understand what’s the main difference between rich and poor people. The former invest in themselves and make money work for them while the main mission of the latter is to find a stable job. The concepts in the book will help you level up your financial skills and give you a different perspective on making money. Learning how to handle your finances is essential for a quality living. You can’t be truly happy and satisfied with your life if you don’t have enough money to cover your basic needs. Rich Dad Poor Dad by Robert Kiyosaki tells a great story about how we should manage our income."),
    SummaryEntry(
        id: _uuid.v1(),
        title: 'The Goal: A Process of Ongoing Improvement',
        subtitle: 'Eliyahu Goldratt',
        date: 'February 20, 2023',
        body:
            "Eliyahu Goldratt, explains in a really approachable language the Theory of Constraints (TOC) – a theory developed by the author himself. The main message is the following: What determines the strength of a chain is the weakest link. So, what you must do is to find the weakest links in the systems you are part of and figure out a way to strengthen them. Sadly, what is often holding us back to make adjustments is the thinking: “that’s the way it was always done”. The book does have a cure for that, though. It gives the reader an innovative thinking process that can help overcome the resistance to change."),
    SummaryEntry(
        id: _uuid.v1(),
        title: 'The ONE Thing',
        subtitle: 'Gary Keller',
        date: 'March 5, 2023',
        body:
            "The ONE Thing introduces a counterintuitive philosophy about succeeding in life – going small and focusing one doing only ONE thing. Gary Keller explains in great detail why you should shorten your to-do list. Actually, to get rid of your to-do list and make it do-only-one-thing list. Along with that, the book will force you to answer some no so common questions which will potentially help you find what’s most important for you in your life. Contrary to what we think, we don’t need to involve ourselves with thousands of things to achieve the success we are aiming for. We only need to do one thing. So, your first task in life should be to find that one thing, which when you repeatedly do, every-single-day, will help you achieve your goal(s) in life. \n\n While most productivity authors try to help you do a lot of things simultaneously, Gary Keller explains why you should focus only on doing one thing. Although the text is full of clichés and you-can-do-it phrases, The ONE Thing is an overall good read about how to manage your time well and how to find your most important thing in life. My biggest take from the book is that not everything deserves equal time and that finding your one thing (obviously) is essential if you want to get better in life. So, if you don’t know yet, think, and finally choose the most impactful thing you can do to help other people around. Once you know, focus your time on this ONE thing."),
    SummaryEntry(
        id: _uuid.v1(),
        title: 'The 5 AM Club',
        subtitle: 'Robin Sharma',
        date: 'April 15, 2023',
        body:
            "Beneath the story about three strangers who wear clothes with cheesy slogans on them and crave becoming world-class for unknown reasons hides a simple message: get up at 5 am. In essence, the 5 AM Club is a collection of widely popular quotes connected by a tasteless soap-opera-like fairytale that will make you want to punch someone in the face – most probably the author, Robin Sharma, for writing this. We are slowly turning into a mob of cyber-zombies who crave more. If you want to become a true needle-mover, a world-changed, as the author loves to say in the book, you should not only be less interested in your social media following, but also schedule more time for yourself so you can get better at your craft. And since our lives are overpopulated with stuff to do, Sharma’s solution for having enough time to pursue our true desires – which could have been said in around 30 pages, instead of 332 – is to get up at 5 AM and perform a short set of routines. \n\n We’re slowly turning into a mob of cyber-zombies who crave more. If you want to become a true needle-mover, a world-changed, as the author loves to say in the book, you should not only be less interested in your social media following, but also schedule more time for yourself so you can get better at your craft. And since our lives are overpopulated with stuff to do, Sharma’s solution for having enough time to pursue our true desires – which could have been said in around 30 pages, instead of 332 – is to get up at 5 AM and perform a short set of routines.")
  ];

  Future<List<SummaryEntry>> retrieveSummaries() async {
    return await Future.delayed(const Duration(seconds: 1), () {
      print("* Initial: Data Length ${_summaries.length}");
      return _summaries;
    });
  }

  Future<SummaryEntry> addEntry(SummaryForm value) async {
    return await Future.delayed(const Duration(seconds: 1), () {
      print("* Add: Data Length ${_summaries.length}");
      SummaryEntry newEntry = SummaryEntry(
          id: _uuid.v1(),
          title: value.title,
          subtitle: value.subtitle,
          date: value.date,
          body: value.body);

      _summaries.insert(0, newEntry);

      print("** Add: Data Length ${_summaries.length}");
      return newEntry;
    });
  }

  Future<List<SummaryEntry>> deleteEntry(String id) async {
    return await Future.delayed(const Duration(seconds: 1), () {
      print("* Delete: Data Length ${_summaries.length}");
      _summaries.removeWhere((element) => element.id == id);

      print("** Delete: Data Length ${_summaries.length}");
      return _summaries;
    });
  }
}
