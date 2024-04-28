import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lily/models/books.dart';

class BookDetails extends StatefulWidget {
  final String pageTitle;
  final Book book;
  const BookDetails({super.key, required this.book, required this.pageTitle});

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails>
    with SingleTickerProviderStateMixin {
  bool isFavorite = false;
  late TabController _tabController;
  int selectedTab = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      selectedTab = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.pageTitle),
          ),
          body: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.book.details!.series != null ||
                      widget.book.details!.volume != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 25.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: RichText(
                          text: TextSpan(
                            text:
                                '${widget.book.details!.series?.title} #${widget.book.details!.volume}',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontStyle: FontStyle.italic,
                                ),
                          ),
                        ),
                      ),
                    ),
                  (widget.book.details!.readingDetails?.isReading == true &&
                              widget.book.details!.readingDetails
                                      ?.currentPage ==
                                  widget.book.details!.totalPage ||
                          widget.book.details!.readingDetails?.isReading ==
                                  false &&
                              widget.book.details!.readingDetails
                                      ?.currentPage !=
                                  widget.book.details!.totalPage)
                      ? GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Update reading progress'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                        'Current page: ${widget.book.details!.readingDetails!.currentPage}'),
                                    const SizedBox(height: 10),
                                    TextField(
                                      decoration: InputDecoration(
                                        labelText: 'Enter new page',
                                        hintText:
                                            'Current page: ${widget.book.details!.readingDetails!.currentPage}',
                                      ),
                                    ),
                                  ],
                                ),
                                actions: [
                                  FilledButton.tonal(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cancel'),
                                  ),
                                  FilledButton(
                                    onPressed: () {
                                      // Update reading progress
                                      Navigator.pop(context);
                                    },
                                    child: Text('Update'),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: RichText(
                            text: TextSpan(
                              text:
                                  '${widget.book.details!.readingDetails!.currentPage}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      ' / ${widget.book.details!.totalPage} pages',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        )
                      : RichText(
                          text: TextSpan(
                            text: widget.book.details != null
                                ? '${widget.book.details!.totalPage} pages'
                                : 'No details available',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 10.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                        child: Hero(
                          tag: widget.book.isbn,
                          child: Image.network(
                            width: 150,
                            widget.book.imageCover,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        widget.book.title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.book.author!.name,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                      ),
                    ],
                  )),
              TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(text: 'Book Information'),
                  Tab(text: 'Reviews'),
                ],
              ),
              Expanded(
                flex: 1,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView(
                      shrinkWrap: true,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 75),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Description',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                      ),
                                ),
                              ),
                              DropCapText(
                                '${widget.book.description}',
                                dropCapPadding:
                                    const EdgeInsets.only(right: 10.0),
                                style: Theme.of(context).textTheme.bodySmall,
                                textAlign: TextAlign.justify,
                                forceNoDescent: true,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      color: Colors.blue,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
