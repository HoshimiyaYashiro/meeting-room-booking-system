import { CollectionConfig } from 'payload/types'
import Roles from './Roles'
import Avatar from './Avatar';

const Users: CollectionConfig = {
  slug: 'users',
  auth: true,
  admin: {
    useAsTitle: 'email',
  },
  fields: [
    {
      name: 'fullName',
      type: 'text',
    },
    {
      name: 'role',
      type: 'relationship',
      relationTo: Roles.slug,
    },
    {
      name: 'roleCode',
      type: 'text',
      admin: {
        hidden: true,
      },
    },
    {
      name: 'avatar',
      type: 'upload',
      relationTo: Avatar.slug,
    },
    {
      name: 'phoneNumber',
      type: 'text',
    },
    {
      name: 'settings',
      type: 'json',
      defaultValue: {},
    }
    
  ],
  hooks: {
    beforeChange: [
      async ({ data, req }) => {
        if (data.role) {
          const role = await req.payload.findByID({
            collection: 'roles',
            id: data.role,
          });
          data.roleCode = role.code; // Lưu mã code của role vào user
        }
        return data;
      },
    ],
  },
}

export default Users
