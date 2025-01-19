import 'package:flutter/material.dart';
import 'package:flutter_card/event_module/event_logic.dart';
import 'package:flutter_card/event_module/event_model.dart';
import 'package:provider/provider.dart';

class EventsScreen extends StatefulWidget {
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<EventLogic>().fetchEvents(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
      ),
      body: Consumer<EventLogic>(
        builder: (context, eventProvider, child) {
          if (eventProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (eventProvider.error.isNotEmpty) {
            return Center(child: Text(eventProvider.error));
          }

          if (eventProvider.events.isEmpty) {
            return const Center(child: Text('No events found'));
          }

          return _buildGridView(eventProvider.events);
        },
      ),
    );
  }

  Widget _buildGridView(List<Event> events) {
    return RefreshIndicator( onRefresh: ()async {
      context.read<EventLogic>().fetchEvents();
      context.read<EventLogic>().setLoading();
    },
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
      ),
          itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              return _buildItemCard(event)
;            },
          ),
    );
  }

  Widget _buildItemCard(Event event) {
    return Card(
      child: Column(
        children: [
          Image.network(
            event.images,
            fit: BoxFit.cover,
            width: double.maxFinite,
          ),
          Text(event.title),
          Text(event.description),
          const SizedBox(height: 8.0),
          Text('Date: ${event.date.toString()}'),
        ],
      ),
    );
  }
}