import { CollectionConfig } from 'payload/types'
import Users from '../Users'
import Rooms from '../rooms'

const Meetings: CollectionConfig = {
  slug: 'meetings',
  admin: {
    useAsTitle: 'title',
  },
  fields: [
    {
      name: 'title',
      type: 'text',
    },
    {
      name: 'organizer',
      type: 'relationship',
      relationTo: Users.slug,
      required: true,
    },
    {
      name: 'room',
      type: 'relationship',
      relationTo: Rooms.slug,
      required: true,
    },
    {
      name: 'startTime',
      type: 'date',
    },
    {
      name: 'endTime',
      type: 'date',
    },
    {
      name: 'description',
      type: 'textarea',
    },
    {
      name: 'cron',
      type: 'text',
    }
  ]
}

export default Meetings
